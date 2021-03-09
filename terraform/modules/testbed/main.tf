resource "tls_private_key" "ssh_key" {
  algorithm   = "RSA"
  rsa_bits = "4096"
}

resource "null_resource" "save_ssh_key"{
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key.private_key_pem}' > /mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/ssh-key/ssh-key.pem ; chmod 600 /mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/ssh-key/ssh-key.pem"
  }
}
resource "null_resource" "save_ansible_vars"{
  provisioner "local-exec" {
    command = <<EOT
        cat <<\EOF >> /mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/vars_files/cluster_ips.json
        {
          "cluster1_master_external_ip": "${local.cluster1_master_external_ip }",
          "cluster1_worker1_external_ip":"${local.cluster1_worker1_external_ip}",
          "cluster1_worker2_external_ip": "${local.cluster1_worker2_external_ip}",
          "cluster1_master_internal_ip": "${local.cluster1_master_internal_ip }",
          "cluster1_worker1_internal_ip": "${local.cluster1_worker1_internal_ip}",
          "cluster1_worker2_internal_ip": "${local.cluster1_worker2_internal_ip}",
          "cluster2_master_external_ip": "${local.cluster2_master_external_ip }",
          "cluster2_worker1_external_ip": "${local.cluster2_worker1_external_ip}",
          "cluster2_worker2_external_ip": "${local.cluster2_worker2_external_ip}",
          "cluster2_master_internal_ip": "${local.cluster2_master_internal_ip }",
          "cluster2_worker1_internal_ip": "${local.cluster2_worker1_internal_ip}",
          "cluster2_worker2_internal_ip": "${local.cluster2_worker2_internal_ip}",
          "cluster3_master_external_ip": "${local.cluster3_master_external_ip }",
          "cluster3_worker1_external_ip": "${local.cluster3_worker1_external_ip}",
          "cluster3_worker2_external_ip": "${local.cluster3_worker2_external_ip}",
          "cluster3_master_internal_ip": "${local.cluster3_master_internal_ip }",
          "cluster3_worker1_internal_ip": "${local.cluster3_worker1_internal_ip}",
          "cluster3_worker2_internal_ip": "${local.cluster3_worker2_internal_ip}"
        }
        EOF
    EOT
  }
}
locals {
  cluster1_master_external_ip = module.provision-regionA-clusters.0.master-node-public-ip
  cluster1_worker1_external_ip = module.provision-regionA-clusters.0.worker1-node-public-ip
  cluster1_worker2_external_ip = module.provision-regionA-clusters.0.worker2-node-public-ip
  cluster1_master_internal_ip = module.provision-regionA-clusters.0.master-node-ip
  cluster1_worker1_internal_ip = module.provision-regionA-clusters.0.worker1-node-ip
  cluster1_worker2_internal_ip = module.provision-regionA-clusters.0.worker2-node-ip
  cluster2_master_external_ip = module.provision-regionA-clusters.1.master-node-public-ip
  cluster2_worker1_external_ip = module.provision-regionA-clusters.1.worker1-node-public-ip
  cluster2_worker2_external_ip = module.provision-regionA-clusters.1.worker2-node-public-ip
  cluster2_master_internal_ip = module.provision-regionA-clusters.1.master-node-ip
  cluster2_worker1_internal_ip = module.provision-regionA-clusters.1.worker1-node-ip
  cluster2_worker2_internal_ip = module.provision-regionA-clusters.1.worker2-node-ip
  cluster3_master_external_ip = module.provision-regionB-cluster.0.master-node-public-ip
  cluster3_worker1_external_ip = module.provision-regionB-cluster.0.worker1-node-public-ip
  cluster3_worker2_external_ip = module.provision-regionB-cluster.0.worker2-node-public-ip
  cluster3_master_internal_ip = module.provision-regionB-cluster.0.master-node-ip
  cluster3_worker1_internal_ip = module.provision-regionB-cluster.0.worker1-node-ip
  cluster3_worker2_internal_ip = module.provision-regionB-cluster.0.worker2-node-ip
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
  gcp_regionB-zone = var.gcp_regionB-zone
  regionA-cidr_range = var.regionA-cidr_range
  regionB-cidr_range = var.regionB-cidr_range
}
module "provision-regionA-clusters" {
  count = 2
  source = "../k8s-cluster"
#  zone = data.google_compute_zones.available.names[count.index+1]
  subnet_id = module.provision-cluster-networks.regionA-subnet_id
  cluster_name = "cluster${count.index+1}"
  ssh_pubkey = tls_private_key.ssh_key.public_key_openssh
  gcp_project = var.gcp_project
  gcp_region = var.gcp_regionA
}

module "provision-regionB-cluster" {
  source = "../k8s-cluster"
  count = 1

#  zone = var.gcp_regionB-zone
  subnet_id = module.provision-cluster-networks.regionB-subnet_id
  cluster_name = "cluster${count.index+1}"
  ssh_pubkey = tls_private_key.ssh_key.public_key_openssh
  gcp_project = var.gcp_project
  gcp_region = var.gcp_regionB
}

module "configure-regionA-clusters" {
  depends_on = [module.provision-regionA-clusters]
  count = 2
  source = "../configure-cluster"

  cluster_master_ip = module.provision-regionA-clusters[count.index].master-node-public-ip
  cluster_worker1_ip = module.provision-regionA-clusters[count.index].worker1-node-public-ip
  cluster_worker2_ip = module.provision-regionA-clusters[count.index].worker2-node-public-ip
  cluster_master_internal_ip = module.provision-regionA-clusters[count.index].master-node-ip
  cluster_worker1_internal_ip = module.provision-regionA-clusters[count.index].worker1-node-ip
  cluster_worker2_internal_ip = module.provision-regionA-clusters[count.index].worker2-node-ip
  k8s_ssh_private_key = tls_private_key.ssh_key.private_key_pem
  cni_playbook_path = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/calico/calico_master.yaml"
  cluster = "cluster${count.index+1}"
}
module "configure-regionB-cluster" {
  depends_on = [module.provision-regionB-cluster]
  count = 1
  source = "../configure-cluster"

  cluster_master_ip = module.provision-regionB-cluster[count.index].master-node-public-ip
  cluster_worker1_ip = module.provision-regionB-cluster[count.index].worker1-node-public-ip
  cluster_worker2_ip = module.provision-regionB-cluster[count.index].worker2-node-public-ip
  cluster_master_internal_ip = module.provision-regionB-cluster[count.index].master-node-ip
  cluster_worker1_internal_ip = module.provision-regionB-cluster[count.index].worker1-node-ip
  cluster_worker2_internal_ip = module.provision-regionB-cluster[count.index].worker2-node-ip
  k8s_ssh_private_key = tls_private_key.ssh_key.private_key_pem
  cni_playbook_path = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/calico/calico_master.yaml"
  cluster = "cluster3"
}


module "test-suite" {
  depends_on = [module.configure-regionA-clusters, module.configure-regionB-cluster]
  source = "../test-suite"
  count = 1

  cluster = "cluster${count.index+1}"
  cluster_master_ip = module.provision-regionA-clusters[count.index].master-node-public-ip
  cluster_worker1_ip = module.provision-regionA-clusters[count.index].worker1-node-public-ip
  cluster_worker2_ip = module.provision-regionA-clusters[count.index].worker2-node-public-ip
  cluster_master_internal_ip = module.provision-regionA-clusters[count.index].master-node-ip
  cluster_worker1_internal_ip = module.provision-regionA-clusters[count.index].worker1-node-ip
  cluster_worker2_internal_ip = module.provision-regionA-clusters[count.index].worker2-node-ip
  k8s_ssh_private_key = tls_private_key.ssh_key.private_key_pem
}
//
//module "cluster2" {
//  source = "../modules/k8s-cluster"
//  zone = data.google_compute_zones.available.names[2]
//  subnet_id = module.k8s-testnet.subnet_id
//  cluster_name = "cluster2"
//  ssh_pubkey = tls_private_key.ssh_key.public_key_openssh
//}