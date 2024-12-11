package dtos

type Vehicle struct {
	Id           int    `json:"id"`
	Model        string `json:"model"`
	LicencePlate string `json:"licencePlate"`
	Color        string `json:"color"`
}

type CreateVehicleRequest struct {
	Model        string `json:"model"`
	LicencePlate string `json:"licencePlate"`
	Color        string `json:"color"`
}

type User_Vehicle struct {
	Id      int `json:"id"`
	User    int `json:"userId"`
	Vehicle int `json:"vehicleId"`
}

type CreateUser_VehicleRequest struct {
	User    int `json:"userId"`
	Vehicle int `json:"vehicleId"`
}
