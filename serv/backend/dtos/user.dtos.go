// SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>
//
// SPDX-License-Identifier: GPL-3.0-or-later

package dtos

type User struct {
	Id                 string `json:"id"`
	Name               string `json:"name"`
	Phone              string `json:"phone"`
	Address            string `json:"address"`
	Gender             string `json:"gender"`
	BirthDate          string `json:"birthDate"`
	DriverRating       uint32 `json:"driverRating"`
	NumberOfRidesGiven uint32 `json:"numberOfRidesGiven"`
	PassengerRating    uint32 `json:"passengerRating"`
	NumberOfRidesTaken uint32 `json:"numberOfRidesTaken"`
	ImgUrl             string `json:"imgUrl"`
	Role               string `json:"role"`
	CommunityId        string `json:"communityId"`
}

type CreateUserRequest struct {
	Name               string `json:"name"`
	Phone              string `json:"phone"`
	Address            string `json:"address"`
	Gender             string `json:"gender"`
	BirthDate          string `json:"birthDate"`
	DriverRating       uint32 `json:"driverRating"`
	NumberOfRidesGiven uint32 `json:"numberOfRidesGiven"`
	PassengerRating    uint32 `json:"passengerRating"`
	NumberOfRidesTaken uint32 `json:"numberOfRidesTaken"`
	ImgUrl             string `json:"imgUrl"`
	Role               string `json:"role"`
	CommunityId        string `json:"communityId"`
}
