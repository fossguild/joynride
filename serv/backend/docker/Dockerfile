FROM golang:1.23 AS base

# Create another stage called "dev" that is based off of our "base" stage (so we have golang available to us)
FROM base AS dev

# Install the air binary so we get live code-reloading when we save files
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

# Run the air command in the directory where our code will live
WORKDIR /opt/app/api
CMD ["air"]
