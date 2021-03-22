resource "tls_private_key" "ssh_key" {
  algorithm   = "RSA"
  rsa_bits = "4096"
}

resource "null_resource" "save_ssh_key"{
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key.private_key_pem}' > /mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/ssh-key/ssh-key.pem ; chmod 600 /mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/ssh-key/ssh-key.pem"
  }
}

module "gvnic-image" {
  source = "../compute-image"

}
resource "null_resource" "save_ansible_vars"{
  provisioner "local-exec" {
    command = <<EOT
cat <<EOF > /mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/vars_files/cluster_ips.json
{
  "cluster1_master_public_ip": "${local.cluster1_master_public_ip }",
  "cluster1_worker1_public_ip":"${local.cluster1_worker1_public_ip}",
  "cluster1_worker2_public_ip": "${local.cluster1_worker2_public_ip}",
  "cluster1_master_internal_ip": "${local.cluster1_master_internal_ip }",
  "cluster1_worker1_internal_ip": "${local.cluster1_worker1_internal_ip}",
  "cluster1_worker2_internal_ip": "${local.cluster1_worker2_internal_ip}",
  "cluster2_master_public_ip": "${local.cluster2_master_public_ip }",
  "cluster2_worker1_public_ip": "${local.cluster2_worker1_public_ip}",
  "cluster2_master_internal_ip": "${local.cluster2_master_internal_ip }",
  "cluster2_worker1_internal_ip": "${local.cluster2_worker1_internal_ip}",
  "cluster3_master_public_ip": "${local.cluster3_master_public_ip }",
  "cluster3_worker1_public_ip": "${local.cluster3_worker1_public_ip}",
  "cluster3_master_internal_ip": "${local.cluster3_master_internal_ip }",
  "cluster3_worker1_internal_ip": "${local.cluster3_worker1_internal_ip}"
}
EOF
    EOT
  }
}
locals {
  cluster1_master_public_ip = module.provision-regionA-cluster.master-node-public-ip
  cluster1_worker1_public_ip = module.provision-regionA-cluster.worker1-node-public-ip
  cluster1_worker2_public_ip = module.provision-regionA-cluster.worker2-node-public-ip
  cluster1_master_internal_ip = module.provision-regionA-cluster.master-node-ip
  cluster1_worker1_internal_ip = module.provision-regionA-cluster.worker1-node-ip
  cluster1_worker2_internal_ip = module.provision-regionA-cluster.worker2-node-ip
  cluster2_master_public_ip = module.provision-regionA-auxcluster.master-node-public-ip
  cluster2_worker1_public_ip = module.provision-regionA-auxcluster.worker1-node-public-ip
  cluster2_master_internal_ip = module.provision-regionA-auxcluster.master-node-ip
  cluster2_worker1_internal_ip = module.provision-regionA-auxcluster.worker1-node-ip
  cluster3_master_public_ip = module.provision-regionB-cluster.master-node-public-ip
  cluster3_worker1_public_ip = module.provision-regionB-cluster.worker1-node-public-ip
  cluster3_master_internal_ip = module.provision-regionB-cluster.master-node-ip
  cluster3_worker1_internal_ip = module.provision-regionB-cluster.worker1-node-ip
}
#Provision 3 clusters. One region1-zoneA, one region1-zoneB, one region2-zoneA
/*Test runs:
Provision server in first cluster, then a client in all three
Run test suite script from each client container
Save results into standardized format (CSV?) with CNI and testcase specific filenames
Rerun for each CNI, collate results, chart manually
*/

module "provision-cluster-networks" {
  source = "../cluster-networks"

  gcp_project = var.gcp_project
  gcp_regionA = var.gcp_regionA
  gcp_regionB = var.gcp_regionB
  gcp_regionB-zone = var.gcp_regionB_zone
  regionA-cidr_range = var.regionA_cidr_range
  regionB-cidr_range = var.regionB_cidr_range
}
module "provision-regionA-cluster" {
  depends_on = [module.provision-cluster-networks]
  source = "../k8s-cluster"
#  zone = data.google_compute_zones.available.names[count.index+1]
  subnet_id = module.provision-cluster-networks.regionA-subnet_id
  cluster_name = "cluster1"
  ssh_pubkey = tls_private_key.ssh_key.public_key_openssh
  gcp_project = var.gcp_project
  gcp_region = var.gcp_regionA
  machine_type = var.machine_type
  instance_image = module.gvnic-image.image_id
}
module "provision-regionA-auxcluster" {
  depends_on = [module.provision-cluster-networks]
  source = "../k8s-auxcluster"
#  zone = data.google_compute_zones.available.names[count.index+1]
  subnet_id = module.provision-cluster-networks.regionA-subnet_id
  cluster_name = "cluster2"
  ssh_pubkey = tls_private_key.ssh_key.public_key_openssh
  gcp_project = var.gcp_project
  gcp_region = var.gcp_regionA
  machine_type = var.machine_type
  instance_image = module.gvnic-image.image_id
}


module "provision-regionB-cluster" {
  source = "../k8s-auxcluster"
  depends_on = [module.provision-cluster-networks]
  subnet_id = module.provision-cluster-networks.regionB-subnet_id
  cluster_name = "cluster3"
  ssh_pubkey = tls_private_key.ssh_key.public_key_openssh
  gcp_project = var.gcp_project
  gcp_region = var.gcp_regionB
  machine_type = var.machine_type
  instance_image = module.gvnic-image.image_id
}
