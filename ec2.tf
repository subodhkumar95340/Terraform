resource "tls_private_key" "dev_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.generated_key_name
  public_key = tls_private_key.dev_key.public_key_openssh

  provisioner "local-exec" {    # Generate "terraform-key-pair.pem" in current directory
    command = "echo '${tls_private_key.dev_key.private_key_pem}' > ./'${var.generated_key_name}'.pem"
  }

   provisioner "local-exec" {
     command = "chmod 400 ./'${var.generated_key_name}'.pem"
   }
}


resource "aws_instance" "Terraform_webserver" {
    ami             = "${lookup(var.ami_id, var.region)}"
    instance_type   = "${var.Terraform_webserver_instance_type}"
    key_name        = aws_key_pair.generated_key.key_name
    tags = {
        Name        = "${var.Terraform_webserver_tag_name}"
        
    }

provisioner "local-exec" {
    command = "echo ${aws_instance.Terraform_webserver.private_ip} >> ip_list.txt"
}

provisioner "local-exec" {
    command = "echo ${aws_instance.Terraform_webserver.arn} >> arn.txt"
}

}


