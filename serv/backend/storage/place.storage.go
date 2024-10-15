// SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>
//
// SPDX-License-Identifier: GPL-3.0-or-later

package storage

import (
	"context"
	"fmt"

	"github.com/fossguild/joynride/tree/dev/serv/dtos"
)

func (s *Storage) CreatePlace(ctx context.Context, i dtos.CreatePlaceRequest) (*dtos.Place, error) {
	row := s.conn.QueryRowContext(
		ctx,
		"INSERT INTO place(name, address, latitude, longitude) VALUES($1, $2, $3, $4) RETURNING *",
		i.Name, i.Address, i.Latitude, i.Longitude,
	)

	return ScanPlace(row)
}

func (s *Storage) ListPlaces(ctx context.Context) ([]*dtos.Place, error) {
	rows, err := s.conn.QueryContext(ctx, "SELECT * FROM place")
	if err != nil {
		return nil, fmt.Errorf("could not retrieve places: %w", err)
	}
	defer rows.Close()

	var places []*dtos.Place
	for rows.Next() {
		item, err := ScanPlace(rows)
		if err != nil {
			return nil, fmt.Errorf("could not scan place: %w", err)
		}

		places = append(places, item)
	}

	return places, nil
}

func ScanPlace(s Scanner) (*dtos.Place, error) {
	place := &dtos.Place{}
	if err := s.Scan(&place.Id, &place.Name, &place.Address, &place.Latitude, &place.Longitude); err != nil {
		return nil, err
	}

	return place, nil
}
