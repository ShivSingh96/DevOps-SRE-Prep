#Scenario: You are tasked with creating VPC peering between two VPCs in different AWS regions using Terraform.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = "vpc-12345678"
  peer_vpc_id   = "vpc-87654321"
  peer_region   = "us-west-2"
  auto_accept   = true
}

resource "aws_route" "peer_routes" {
  for_each = {
    "route-to-peer1" = "10.1.0.0/16"
    "route-to-peer2" = "10.2.0.0/16"
  }
  route_table_id         = "rtb-abcdefg"
  destination_cidr_block = each.value
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
#Key Concepts: Multi-region resource creation, loops with for_each.
