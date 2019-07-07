resource "aws_elb" "my_elb" {
  name            = "myelb"
  subnets         = ["${aws_subnet.my_subnet_public.*.id}"]
  security_groups = ["${aws_security_group.web.*.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 20
  }

  instances                   = ["${aws_instance.web.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags {
    Name = "my_terra_project"
    Name = "my_elb"
  }
}

output "elb_dns" {
  value = "${aws_elb.my_elb.dns_name}"
}
