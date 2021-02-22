output "master-node-ip" {
  value = module.master-node.0.internal_ip
}

output "worker1-node-ip" {
  value = module.worker-node.0.internal_ip
}

output "worker2-node-ip" {
  value = module.worker-node.1.internal_ip
}