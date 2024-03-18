resource "aws_db_instance" "default" {
  allocated_storage         = 20
  storage_type              = "gp2"
  engine                    = "postgres"
  engine_version            = "16.1"
  instance_class            = "db.t3.micro"
  username                  = "manu"
  password                  = "manupass"
  final_snapshot_identifier = "pgsql-snapshot"
  db_name                   = "manudb"
  publicly_accessible       = true
  identifier                = "manu-postgresql"

  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "MyPostgresDB"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "address" {
  description = "The address to connect to the DB instance."
  value       = aws_db_instance.default.address
}

output "arn" {
  description = "The ARN of the DB instance."
  value       = aws_db_instance.default.arn
}