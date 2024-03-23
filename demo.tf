resource "aws_lb_target_group" "dev" {
    name = "devtg"
    vpc_id = aws_vpc.prod.id
    protocol = "TCP"
    port = 8080
    tags = {
        Name = "${var.vpc_name}-tg"
    }

  }
  

resource "aws_lb_target_group_attachment" "attachtg" {
    target_group_arn = aws_lb_target_group.dev.arn
    target_id = aws_instance.publicserver[0].id
    port = 8080
  
}
resource "aws_lb_target_group_attachment" "attachtg1" {
    target_group_arn = aws_lb_target_group.dev.arn
    target_id = aws_instance.privateserver[0].id
    port = 8080
  
}

resource "aws_lb" "networklb" {
    name = "grahanlb"
    internal = false
    load_balancer_type = "network"
    # vpc_id = aws_vpc.prod.id
    subnets = [ aws_subnet.publicsubnets[0].id,
    aws_subnet.publicsubnets[1].id]
  
}

resource "aws_lb_listener" "ram" {
    load_balancer_arn = aws_lb.networklb.arn
    protocol = "TCP"
    port = "80"
    default_action {
        type = "forward"
      target_group_arn = aws_lb_target_group.dev.arn
    }
  
}

