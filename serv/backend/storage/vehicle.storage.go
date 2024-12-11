package storage

import (
	"context"
	"fmt"

	"github.com/fossguild/joynride/serv/backend/dtos"
)

func (s *Storage) GetVehiclesByUserId(ctx context.Context, userId int) ([]*dtos.Vehicle, error) {
	rows, err := s.conn.QueryContext(
		ctx,
		`SELECT v.id, v.model, v.licence_plate, v.color
        FROM vehicle v
        JOIN user_vehicle uv ON v.id = uv.vehicle
        WHERE uv.user = $1`,
		userId,
	)
	if err != nil {
		return nil, fmt.Errorf("could not query vehicles: %w", err)
	}
	defer rows.Close()

	var vehicles []*dtos.Vehicle
	for rows.Next() {
		vehicle := &dtos.Vehicle{}
		if err := rows.Scan(&vehicle.Id, &vehicle.Model, &vehicle.LicencePlate, &vehicle.Color); err != nil {
			return nil, fmt.Errorf("could not scan vehicle: %w", err)
		}
		vehicles = append(vehicles, vehicle)
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("rows error: %w", err)
	}

	return vehicles, nil

}

func (s *Storage) CreateVehicle(ctx context.Context, userId int, vehicleReq dtos.CreateVehicleRequest) (*dtos.Vehicle, error) {
	tx, err := s.conn.BeginTx(ctx, nil)
	if err != nil {
		return nil, fmt.Errorf("could not begin transaction: %w", err)
	}

	var vehicleId int
	err = tx.QueryRowContext(
		ctx,
		`INSERT INTO vehicle (model, licence_plate, color) VALUES ($1, $2, $3) RETURNING id`,
		vehicleReq.Model, vehicleReq.LicencePlate, vehicleReq.Color,
	).Scan(&vehicleId)
	if err != nil {
		tx.Rollback()
		return nil, fmt.Errorf("could not insert vehicle: %w", err)
	}

	_, err = tx.ExecContext(
		ctx,
		`INSERT INTO user_vehicle (user, vehicle) VALUES ($1, $2)`,
		userId, vehicleId,
	)
	if err != nil {
		tx.Rollback()
		return nil, fmt.Errorf("could not insert user vehicle: %w", err)
	}

	if err := tx.Commit(); err != nil {
		return nil, fmt.Errorf("could not commit transaction: %w", err)
	}

	return &dtos.Vehicle{
		Id:           vehicleId,
		Model:        vehicleReq.Model,
		LicencePlate: vehicleReq.LicencePlate,
		Color:        vehicleReq.Color,
	}, nil
}
