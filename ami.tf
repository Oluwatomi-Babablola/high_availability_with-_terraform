data "aws_ssm_parameter" "instance_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


# resource "aws_instance" "web" {
#   ami   =  data.aws_ssm_parameter.instance_ami.value

#   instance_type = "t2.micro"

#   # your other configs...
# }

