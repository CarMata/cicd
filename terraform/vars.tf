variable "app_name" {
  default = "winning-number-service"
}
variable "image" {
  default = "carmata/winning-number-service:latest"
}
variable "container_port" {
  default = 8085
}
variable "node_port" {
  default = 30080
}
