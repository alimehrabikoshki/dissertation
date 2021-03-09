output "cluster1-master-ip" {
  value = module.provision-regionA-clusters.0.master-node-ip
}
output "cluster1-worker1-ip" {
  value = module.provision-regionA-clusters.0.worker1-node-ip
}
output "cluster1-worker2-ip" {
  value = module.provision-regionA-clusters.0.worker2-node-ip
}
output "cluster2-master-ip" {
  value = module.provision-regionA-clusters.1.master-node-ip
}
output "cluster2-worker1-ip" {
  value = module.provision-regionA-clusters.1.worker1-node-ip
}
output "cluster2-worker2-ip" {
  value = module.provision-regionA-clusters.1.worker2-node-ip
}
output "cluster1-master-public-ip" {
  value = module.provision-regionA-clusters.0.master-node-public-ip
}
output "cluster1-worker1-public-ip" {
  value = module.provision-regionA-clusters.0.worker1-node-public-ip
}
output "cluster1-worker2-public-ip" {
  value = module.provision-regionA-clusters.0.worker2-node-public-ip
}
output "cluster2-master-public-ip" {
  value = module.provision-regionA-clusters.1.master-node-public-ip
}
output "cluster2-worker1-public-ip" {
  value = module.provision-regionA-clusters.1.worker1-node-public-ip
}
output "cluster2-worker2-public-ip" {
  value = module.provision-regionA-clusters.1.worker2-node-public-ip
}

output "cluster3-master-ip" {
  value = module.provision-regionB-cluster.0.master-node-ip
}
output "cluster3-worker1-ip" {
  value = module.provision-regionB-cluster.0.worker1-node-ip
}
output "cluster3-worker2-ip" {
  value = module.provision-regionB-cluster.0.worker2-node-ip
}
output "cluster3-master-public-ip" {
  value = module.provision-regionB-cluster.0.master-node-public-ip
}
output "cluster3-worker1-public-ip" {
  value = module.provision-regionB-cluster.0.worker1-node-public-ip
}
output "cluster3-worker2-public-ip" {
  value = module.provision-regionB-cluster.0.worker2-node-public-ip
}
