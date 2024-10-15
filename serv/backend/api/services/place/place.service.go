// SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>
//
// SPDX-License-Identifier: GPL-3.0-or-later

package place_service

import (
	"net/http"

	"github.com/fossguild/joynride/tree/dev/serv/dtos"
	"github.com/fossguild/joynride/tree/dev/serv/storage"
	"github.com/gin-gonic/gin"
)

func GetPlaces(c *gin.Context, storage *storage.Storage) {
	places, err := storage.ListPlaces(c)
	if err != nil {
		errorObj := dtos.Error{Message: err.Error()}
		c.JSON(http.StatusInternalServerError, errorObj)
		return
	}

	c.JSON(http.StatusOK, places)
}

func CreatePlace(c *gin.Context, storage *storage.Storage) {
	var placeData dtos.CreatePlaceRequest

	if err := c.BindJSON(&placeData); err != nil {
		errorObj := dtos.Error{Message: err.Error()}
		c.JSON(http.StatusUnprocessableEntity, errorObj)
		return
	}

	createdPlace, err := storage.CreatePlace(c, placeData)
	if err != nil {
		errorObj := dtos.Error{Message: err.Error()}
		c.JSON(http.StatusInternalServerError, errorObj)
		return
	}

	c.JSON(http.StatusCreated, createdPlace)
}
