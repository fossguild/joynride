// SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>
//
// SPDX-License-Identifier: GPL-3.0-or-later

package main

import (
	"fmt"
	"os"

	"github.com/fossguild/joynride/tree/dev/serv/api"
	"github.com/fossguild/joynride/tree/dev/serv/storage"
)

func main() {
	storage, err := storage.NewStorage(os.Getenv("DATABASE_URL"))
	if err != nil {
		fmt.Printf("could not initialize storage: %s", err)
		os.Exit(1)
	}

	server, err := api.NewApi(os.Getenv("API_SERVER_ADDR"), storage)
	if err != nil {
		fmt.Printf("could not create server: %s", err)
		os.Exit(1)
	}

	server.Start()
}
