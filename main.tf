data "aws_vpc" "vpc" {
  id = var.vpc_id
}

resource "aws_vpc_endpoint" "monitoring" {
  service_name = "com.amazonaws.ap-southeast-2.monitoring"
  vpc_endpoint_type = "Interface"
  vpc_id = data.aws_vpc.vpc.id
  security_group_ids = var.security_group_ids
  subnet_ids = var.subnet_ids
  private_dns_enabled = var.private_dns_enabled
  tags = {
    Name = var.name == null ? "${data.aws_vpc.vpc.tags["Name"]}MonitoringVpcEndpoint" : var.name
  }
}