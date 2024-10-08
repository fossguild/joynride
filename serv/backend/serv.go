// SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>
//
// SPDX-License-Identifier: GPL-3.0-or-later

package main

import (
    "fmt"
    "net/http"
)

func handler (w http.ResponseWriter, r *http.Request){
    fmt.Println("Hello from serv!")
}

func main() {
    http.HandleFunc("/", handler)

    port := ":80"
    fmt.Println("Listening to port", port)
    
    err := http.ListenAndServe(port, nil)
    if err != nil {
        fmt.Println("Failed to start server:", err)
    }
}
