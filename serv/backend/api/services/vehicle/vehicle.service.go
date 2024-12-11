package vehicle_service

import (
	"net/http"
	"strconv"

	"github.com/fossguild/joynride/tree/dev/serv/dtos"
	"github.com/fossguild/joynride/tree/dev/serv/storage"
	"github.com/gin-gonic/gin"
)

func GetUserVehicles(c *gin.Context, storage *storage.Storage) {
	userId, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	vehicles, err := storage.GetVehiclesByUserId(c, userId)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, vehicles)
}

func CreateUserVehicle(c *gin.Context, storage *storage.Storage) {
	userId, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid user ID"})
		return
	}

	var vehicleReq dtos.CreateVehicleRequest
	if err := c.BindJSON(&vehicleReq); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request body"})
		return
	}

	vehicle, err := storage.CreateVehicle(c, userId, vehicleReq)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusCreated, vehicle)
}
