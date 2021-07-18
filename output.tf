output "public_ip" {
    value = "${aws_instance.Test01.public_ip}"
}
