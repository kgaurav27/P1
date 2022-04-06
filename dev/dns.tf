resource "aws_route53_record" "delorean_api" {
  zone_id = data.terraform_remote_state.vpc.outputs.shared_route53_hosted_zone
  name    = "delorean"
  type    = "A"

  alias {
    name                   = aws_alb.delorean_api.dns_name
    zone_id                = aws_alb.delorean_api.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "delorean_proxy" {
  zone_id = data.terraform_remote_state.vpc.outputs.shared_route53_hosted_zone
  name    = "deproxy"
  type    = "A"

  alias {
    name                   = aws_lb.delorean_proxy.dns_name
    zone_id                = aws_lb.delorean_proxy.zone_id
    evaluate_target_health = true
  }
}
