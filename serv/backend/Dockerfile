# SPDX-FileCopyrightText: 2024 The JoynRide Authors and CCOS-USP <https://ccos.icmc.usp.br>
#
# SPDX-License-Identifier: GPL-3.0-or-later

FROM golang:1.23 AS base

# Create another stage called "dev" that is based off of our "base" stage (so we have golang available to us)
FROM base AS dev

# Install the air binary so we get live code-reloading when we save files
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

# Run the air command in the directory where our code will live
WORKDIR /opt/app/api
CMD ["air"]

FROM base AS built

WORKDIR /go/app/api
COPY . .

ENV CGO_ENABLED=0

RUN go get -d -v ./...
RUN go build -o /tmp/joynride_api ./*.go

FROM busybox

COPY --from=built /tmp/joynride_api /usr/bin/joynride_api
CMD ["joynride_api", "start"]
