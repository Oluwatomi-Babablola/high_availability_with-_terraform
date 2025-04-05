resource "aws_launch_template" "launch_template" {
  name     = "launch_template"
  image_id = "ami-0b4a43ee3a19c8b8c"  # Your AMI
  instance_type = "t3.micro"

  # key_name = "cba_keyppair"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  # user_data = filebase64("${path.module}/example.sh")

  tag_specifications {
    resource_type = "instance"
    

    tags = {
      Name = "test"
    }
  }
}