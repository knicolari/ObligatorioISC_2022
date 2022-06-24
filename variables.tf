variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "subnet" {
  default = "172.16.1.0/24"
}

variable "subnet-2" {
  default = "172.16.2.0/24"
}

variable "az1" {
  default = "us-east-1a"
}

variable "az2" {
  default = "us-east-1b"
}

variable "arn_role" {
  default = "arn:aws:iam::661724083420:role/LabRole"
  
}
