// SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>
//
// SPDX-License-Identifier: GPL-3.0-or-later

package storage

import (
	"context"
	"fmt"

	"github.com/fossguild/joynride/serv/backend/dtos"
)

func (s *Storage) CreateUser(ctx context.Context, i dtos.CreateUserRequest) (*dtos.User, error) {
	row := s.conn.QueryRowContext(
		ctx,
		`INSERT INTO "user" (
			name,
			phone,
			address,
			gender,
			birth_date,
			driver_rating,
			number_of_rides_given,
			passenger_rating,
			number_of_rides_taken,
			img_url,
			role,
			community_id
		) VALUES(
			$1,
			$2,
			$3,
			$4,
			$5,
			$6,
			$7,
			$8,
			$9,
			$10,
			$11,
			$12
		) RETURNING *`,
		i.Name,
		i.Phone,
		i.Address,
		i.Gender,
		i.BirthDate,
		i.DriverRating,
		i.NumberOfRidesGiven,
		i.PassengerRating,
		i.NumberOfRidesTaken,
		i.ImgUrl,
		i.Role,
		i.CommunityId,
	)

	return ScanUser(row)
}

func (s *Storage) ListUsers(ctx context.Context) ([]*dtos.User, error) {
	rows, err := s.conn.QueryContext(ctx, "SELECT * FROM \"user\"")
	if err != nil {
		return nil, fmt.Errorf("could not retrieve users: %w", err)
	}
	defer rows.Close()

	var users []*dtos.User
	for rows.Next() {
		item, err := ScanUser(rows)
		if err != nil {
			return nil, fmt.Errorf("could not scan user: %w", err)
		}

		users = append(users, item)
	}

	return users, nil
}

func ScanUser(s Scanner) (*dtos.User, error) {
	user := &dtos.User{}
	if err := s.Scan(
		&user.Id,
		&user.Name,
		&user.Phone,
		&user.Address,
		&user.Gender,
		&user.BirthDate,
		&user.DriverRating,
		&user.NumberOfRidesGiven,
		&user.PassengerRating,
		&user.NumberOfRidesTaken,
		&user.ImgUrl,
		&user.Role,
		&user.CommunityId); err != nil {
		return nil, err
	}

	return user, nil
}

func (s *Storage) GetUser(ctx context.Context, id string) (*dtos.User, error) {
	row := s.conn.QueryRowContext(ctx, "SELECT * FROM \"user\" WHERE id = $1", id)
	return ScanUser(row)
}
