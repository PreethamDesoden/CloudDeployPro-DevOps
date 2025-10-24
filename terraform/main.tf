# Configure AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create Security Group (firewall rules)
resource "aws_security_group" "app_sg" {
  name        = "clouddeploypro-sg"
  description = "Security group for CloudDeployPro application"

  # Allow SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Backend API (port 5000)
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Frontend (port 3000)
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "clouddeploypro-sg"
  }
}

# Create EC2 Instance
resource "aws_instance" "app_server" {
  ami                    = "ami-091d7d61336a4c68f"  # Amazon Linux 2 AMI (free tier)
  instance_type          = "t2.micro"               # Free tier eligible
  security_groups        = [aws_security_group.app_sg.name]
  key_name               = "ec2-github-actions"    # Attach existing key pair
  associate_public_ip_address = true                 # Ensure public IP is assigned

  # User data script to install Docker
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              service docker start
              usermod -a -G docker ec2-user
              
              # Pull and run backend container
              docker run -d -p 5000:5000 --name backend preetham1210/clouddeploypro-backend:latest
              
              # Pull and run frontend container
              docker run -d -p 3000:3000 --name frontend preetham1210/clouddeploypro-frontend:latest
              EOF

  tags = {
    Name = "clouddeploypro-server"
  }
}

# Output the public IP
output "instance_public_ip" {
  value       = aws_instance.app_server.public_ip
  description = "Public IP address of the EC2 instance"
}

output "frontend_url" {
  value       = "http://${aws_instance.app_server.public_ip}:3000"
  description = "Frontend application URL"
}

output "backend_url" {
  value       = "http://${aws_instance.app_server.public_ip}:5000"
  description = "Backend API URL"
}
