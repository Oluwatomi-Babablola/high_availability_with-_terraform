resource "aws_db_instance" "default" {
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "8.0"         # Updated to supported MySQL version
  instance_class    = "db.t3.micro" # Updated to t3.micro
  # name                 = "mydb"
  username             = "admin"
  password             = "yourpassword123" # Preferably use secrets manager for real projects!
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  # vpc_security_group_ids = [aws_security_group.db_sg.id]
  # db_subnet_group_name   = aws_db_subnet_group.db_subnet.id
  publicly_accessible = true
}
