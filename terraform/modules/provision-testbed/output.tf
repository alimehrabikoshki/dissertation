output "cluster1-master-ip" {
  value = module.provision-regionA-cluster.master-node-ip
}
output "cluster1-worker1-ip" {
  value = module.provision-regionA-cluster.worker1-node-ip
}
output "cluster1-worker2-ip" {
  value = module.provision-regionA-cluster.worker2-node-ip
}
output "cluster1-master-public-ip" {
  value = module.provision-regionA-cluster.master-node-public-ip
}
output "cluster1-worker1-public-ip" {
  value = module.provision-regionA-cluster.worker1-node-public-ip
}
output "cluster1-worker2-public-ip" {
  value = module.provision-regionA-cluster.worker2-node-public-ip
}
output "cluster2-master-ip" {
  value = module.provision-regionA-auxcluster.master-node-ip
}
output "cluster2-worker1-ip" {
  value = module.provision-regionA-auxcluster.worker1-node-ip
}

output "cluster2-master-public-ip" {
  value = module.provision-regionA-auxcluster.master-node-public-ip
}
output "cluster2-worker1-public-ip" {
  value = module.provision-regionA-auxcluster.worker1-node-public-ip
}

output "cluster3-master-ip" {
  value = module.provision-regionB-cluster.master-node-ip
}
output "cluster3-worker1-ip" {
  value = module.provision-regionB-cluster.worker1-node-ip
}

output "cluster3-master-public-ip" {
  value = module.provision-regionB-cluster.master-node-public-ip
}
output "cluster3-worker1-public-ip" {
  value = module.provision-regionB-cluster.worker1-node-public-ip
}

