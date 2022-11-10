# Give location of the cloud-config file
data "template_file" "provision_mysql" {
template = file("scripts/add-mysql.yaml")  
}

#EC2 Instance
# Use your own server name instead of 'sqlserver'

resource "aws_instance" "sqlserver" {
ami = "ami-02d63d6d135e3f0f0"
instance_type = "t2.micro"
# Use your own .pem key
key_name = "CloudBroWRCSI"
# Use your own security group name instead of 'sql-server'
vpc_security_group_ids = [aws_security_group.sql-server.id]
associate_public_ip_address = true
# Provision everything included in add-mysql.yaml using cloud-init
user_data = data.template_file.provision_mysql.rendered
root_block_device {
volume_type = "gp2"
volume_size = "8"
delete_on_termination = true
  }
# Fill these tags with your data
tags = {  
Name = "Isti_MySQL"
Email = "csoti.istvan.ifj@gmail.com"
Comment = "Made with Terraform"
  }
}
