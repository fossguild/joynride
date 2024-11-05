// SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>
//
// SPDX-License-Identifier: GPL-3.0-or-later

package user_service

import (
	"net/http"

	"github.com/fossguild/joynride/tree/dev/serv/dtos"
	"github.com/fossguild/joynride/tree/dev/serv/storage"
	"github.com/gin-gonic/gin"
)

func GetUsers(c *gin.Context, storage *storage.Storage) {
	user, err := storage.ListUsers(c)
	if err != nil {
		errorObj := dtos.Error{Message: err.Error()}
		c.JSON(http.StatusInternalServerError, errorObj)
		return
	}

	c.JSON(http.StatusOK, user)
}

func CreateUser(c *gin.Context, storage *storage.Storage) {
	var userData dtos.CreateUserRequest

	if err := c.BindJSON(&userData); err != nil {
		errorObj := dtos.Error{Message: err.Error()}
		c.JSON(http.StatusUnprocessableEntity, errorObj)
		return
	}

	createdUser, err := storage.CreateUser(c, userData)
	if err != nil {
		errorObj := dtos.Error{Message: err.Error()}
		c.JSON(http.StatusInternalServerError, errorObj)
		return
	}

	c.JSON(http.StatusCreated, createdUser)
}
