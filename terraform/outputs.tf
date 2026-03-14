output "node1_ip" {
  value = aws_instance.k8s_node1.public_ip
}

output "node2_ip" {
  value = aws_instance.k8s_node2.public_ip
}

output "alb_dns" {
  value = aws_lb.devops_alb.dns_name
}
