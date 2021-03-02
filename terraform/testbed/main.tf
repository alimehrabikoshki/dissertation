data "google_compute_zones" "available" {
  project       = var.gcp_project
  region        = var.gcp_region
  status        = "UP"
}
resource "tls_private_key" "ssh_key" {
  algorithm   = "RSA"
  rsa_bits = "4096"
}

resource "null_resource" "save_ssh_key"{
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key.private_key_pem}' > /mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/ssh-key/ssh-key.pem ; chmod 660 /mnt/c/Users/Ali/PycharmProjects/dissertation/terraform/auth/ssh-key/ssh-key.pem"
  }
}
module "k8s-testnet" {
  source = "../modules/compute-network"
  cidr_range = var.cidr_range
}
resource "google_compute_firewall" "k8s-allow-traffic" {
  name    = "test-firewall"
  network = module.k8s-testnet.network_id

  allow {
    protocol = "all"
  }
#  source_ranges = ["10.0.0.0/8"]
}

module "provision-cluster" {
  count = 2
  source = "../modules/k8s-cluster"
  zone = data.google_compute_zones.available.names[count.index+1]
  subnet_id = module.k8s-testnet.subnet_id
  cluster_name = "cluster${count.index+1}"
  ssh_pubkey = tls_private_key.ssh_key.public_key_openssh
}

module "configure-cluster" {
  depends_on = [module.provision-cluster]
  count = 2
  source = "../modules/configure-cluster"
  cluster_master_ip = module.provision-cluster[count.index].master-node-public-ip
  cluster_worker1_ip = module.provision-cluster[count.index].worker1-node-public-ip
  cluster_worker2_ip = module.provision-cluster[count.index].worker2-node-public-ip
  cluster_master_internal_ip = module.provision-cluster[count.index].master-node-ip
  cluster_worker1_internal_ip = module.provision-cluster[count.index].worker1-node-ip
  cluster_worker2_internal_ip = module.provision-cluster[count.index].worker2-node-ip
  k8s_ssh_private_key = tls_private_key.ssh_key.private_key_pem
  cni_playbook_path = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/calico/calico_master.yaml"
  cluster = "cluster${count.index+1}"
}

module "test-suite" {
  depends_on = [module.configure-cluster]
  source = "../modules/test-suite"

  count = 1
  cluster = "cluster${count.index+1}"
  cluster_master_ip = module.provision-cluster[count.index].master-node-public-ip
  cluster_worker1_ip = module.provision-cluster[count.index].worker1-node-public-ip
  cluster_worker2_ip = module.provision-cluster[count.index].worker2-node-public-ip
  cluster_master_internal_ip = module.provision-cluster[count.index].master-node-ip
  cluster_worker1_internal_ip = module.provision-cluster[count.index].worker1-node-ip
  cluster_worker2_internal_ip = module.provision-cluster[count.index].worker2-node-ip
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