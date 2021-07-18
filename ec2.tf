resource "aws_instance" "Test01" {
    ami             = "${lookup(var.ami_id, var.region)}"
    instance_type   = "${var.Test_instance_type}"
    key_name        = "${var.key_name}"

#    provisioner "file" {
#      source        = "index.html"
#      destination   = "F:/index.html"
#    }

#    provisioner "remote-exec" {
#      inline = [
#          "sudo apt install apache2 -y",
#          "sudo systemctl restart apache2",
#          "sudo systemctl status apache2"
#      ]
#    }
#   connection {
# #    type                 = "ssh"
#      bastion_user         = "ubuntu"
#      private_key          = "${file("${var.private_key_path}")}"
#      host                 = "${aws_instance.Test01.public_ip}"
#   }


provisioner "local-exec" {
    command = "echo ${aws_instance.Test01.private_ip} >> ip_list.txt"
}

provisioner "local-exec" {
    command = "echo ${aws_instance.Test01.arn} >> arn.txt"
}

}
