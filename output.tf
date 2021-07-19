############################EC2########################

output "public_ip" {
    value = "${aws_instance.Terraform_webserver.public_ip}"
}

output "private_ip" {
    value    = "${aws_instance.Terraform_webserver.private_ip}"
}

output "id" {
    value    = "${aws_instance.Terraform_webserver.id}"
}

output "public_dns" {
    value    = "${aws_instance.Terraform_webserver.public_dns}"
}

