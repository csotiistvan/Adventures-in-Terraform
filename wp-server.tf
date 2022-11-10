data "template_file" "provision_wp" {
template = file("scripts/add-wp.yaml")
}

# Use your own server name instead of 'wpserver'

resource "aws_instance" "wpserver" {
ami = "ami-02d63d6d135e3f0f0"
instance_type = "t2.micro"
# Use your own .pem key
key_name = "CloudBroWRCSI"
vpc_security_group_ids = [aws_security_group.wp-server.id]
# Use your own security group name instead of 'wp-server'
associate_public_ip_address = true
# Provision everything included in add-wp.yaml using cloud-init
user_data = data.template_file.provision_wp.rendered
root_block_device {
volume_type = "gp2"
volume_size = "8"
delete_on_termination = true
  }
# Fill these tags with your data
tags = {  
Name = "Isti_Wordpress"
Email = "csoti.istvan.ifj@gmail.com"
Comment = "Made with Terraform"
  }
connection {
    type = "ssh"
    host = aws_instance.wpserver.public_ip
    user = "ubuntu"
    private_key = file("CloudBroWRCSI.pem")
    }
# A none too elegant solution to copy a conf file to the created EC2 instance
provisioner "file" {
    source      = "scripts/wordpress.conf"
    destination = "/tmp/wordpress.conf"
     }
}
