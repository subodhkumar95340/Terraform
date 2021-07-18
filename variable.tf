variable "access_key" {}
variable "secret_key" {}
variable "region" {
default="us-east-1"
}

variable "Test_instance_type" {
       type         = string
       default      = "t2.micro"
       description  = "Test Instance"
}

variable "ami_id" {
    type = map
    default = {
        us-east-1    = "ami-09e67e426f25ce0d7"
        us-east-2    = "ami-0b9064170e32bde34"
        us-west-1    = "ami-0a9451b714c643b38"
    }
}

variable "key_name" {
    type           = string
    default        = "Test_Terraform"
    description    = "Key file"
}

variable "private_key_path" {
    type           = string
    default        = "F:/"
}
