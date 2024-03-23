# resource "aws_lb_target_group" "prodlb" {
#   name = "devnlb"
#   port = 8080
#   protocol = "TCP"
#   vpc_id   = aws_vpc.prod.id
#   tags = {
#     Name = "${var.vpc_name}-alb"
#   }
# }

# resource "aws_lb_target_group_attachment" "tgattachment" {
#  target_group_arn = aws_lb_target_group.prodlb.arn
#  target_id        = aws_instance.publicserver[0].id
#  port             = 8080
# }
# resource "aws_lb_target_group_attachment" "tgattachment1" {
#  target_group_arn = aws_lb_target_group.prodlb.arn
#  target_id        = aws_instance.privateserver[0].id
#  port             = 8080
# }

# resource "aws_lb" "nlbload" {
#   name               = "priyanlb"
#   internal           = false
#   load_balancer_type = "network"
#   security_groups    = [aws_security_group.sg.id]

#   # access_logs {
#   #   bucket  = "my-logs"
#   #   prefix  = "my-app-lb"
#   #   enabled = true
#   # }

#   subnets =[aws_subnet.publicsubnets[0].id,
#   aws_subnet.publicsubnets[1].id]
  
# }
# resource "aws_lb_listener" "nlb" {
#   load_balancer_arn = aws_lb.nlbload.arn
#   port              = "80"
#   protocol          = "TCP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.prodlb.arn
#   }
# }
