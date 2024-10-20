// SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>
//
// SPDX-License-Identifier: GPL-3.0-or-later

package api

import (
	"errors"

	place_service "github.com/fossguild/joynride/tree/dev/serv/api/services/place"
	"github.com/fossguild/joynride/tree/dev/serv/storage"
	"github.com/gin-gonic/gin"
)

type Api struct {
	addr    string
	Storage *storage.Storage
}

func NewApi(addr string, storage *storage.Storage) (*Api, error) {
	if addr == "" {
		return nil, errors.New("addr cannot be blank")
	}

	return &Api{
		addr:    addr,
		Storage: storage,
	}, nil
}

func (api *Api) Start() {
	router := gin.Default()

	router.GET("places", func(ctx *gin.Context) { place_service.GetPlaces(ctx, api.Storage) })
	router.POST("places", func(ctx *gin.Context) { place_service.CreatePlace(ctx, api.Storage) })

	router.Run(api.addr)
}
