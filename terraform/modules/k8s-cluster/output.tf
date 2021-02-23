output "master-node-ip" {
  value = module.master-node.0.internal_ip
}

output "worker1-node-ip" {
  value = module.worker-node.0.internal_ip
}

output "worker2-node-ip" {
  value = module.worker-node.1.internal_ip
}
output "master-node-public-ip" {
  value = module.master-node.0.public_ip
}

output "worker1-node-public-ip" {
  value = module.worker-node.0.public_ip
}

output "worker2-node-public-ip" {
  value = module.worker-node.1.public_ip
}