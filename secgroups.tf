resource "aws_security_group" "wp-server" { # Use your own security group name instead of 'wp-server', refer to this in wp-server.tf
name = "wp-server"
description = "Allow HTTP and SSH traffic"

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sql-server" { # Use your own security group name instead of 'sql-server', refer to this in sql-server.tf
name = "sql-server"
description = "Allow MySQL only from wp-server security group and SSH traffic"

ingress {
from_port = 3306
to_port = 3306
protocol = "tcp"
security_groups = [aws_security_group.wp-server.id] # Use your own security group name instead of 'wp-server' same as in line #1
  }

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
  }
}