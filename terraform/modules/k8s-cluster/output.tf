output "master-node-ip" {
  value = module.master-node.*.internal_ip

}

output "worker1-node-ip" {
  value = module.worker-node.*.internal_ip
}
output "worker2-node-ip" {
  value = module.worker-node.*.internal_ip
}