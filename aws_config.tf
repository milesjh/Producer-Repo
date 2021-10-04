# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }

# resource "aws_subnet" "corp-it" {
#   vpc_id     = "${aws_vpc.main.id}"
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "corp-it"
#   }
# }

# resource "aws_subnet" "research" {
#   vpc_id     = "${aws_vpc.main.id}"
#   cidr_block = "10.0.2.0/24"

#   tags = {
#     Name = "research"
#   }
# }

# # resource "aws_subnet" "finance" {
# #   vpc_id     = "${aws_vpc.main.id}"
# #   cidr_block = "10.0.3.0/24"

# #   tags = {
# #     Name = "finance"
# #   }
# # }

# # resource "aws_subnet" "mfg" {
# #   vpc_id     = "${aws_vpc.main.id}"
# #   cidr_block = "10.0.4.0/24"

# #   tags = {
# #     Name = "mfg"
# #   }
# # }
