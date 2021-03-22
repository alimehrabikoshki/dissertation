locals {
  nodes = {
    cluster1_master_public_ip = var.cluster1_master_public_ip
    cluster1_worker1_public_ip = var.cluster1_worker1_public_ip
    cluster1_worker2_public_ip = var.cluster1_worker2_public_ip
    cluster2_master_public_ip = var.cluster2_master_public_ip
    cluster2_worker1_public_ip = var.cluster2_worker1_public_ip
    cluster3_master_public_ip = var.cluster3_master_public_ip
    cluster3_worker1_public_ip = var.cluster3_worker1_public_ip
  }
}
module "configure-regionA-cluster1" {
  source = "../configure-cluster"

  cluster_master_ip = var.cluster1_master_public_ip
  cluster_worker1_ip = var.cluster1_worker1_public_ip
  cluster_worker2_ip = var.cluster1_worker2_public_ip
  cluster_master_internal_ip = var.cluster1_master_internal_ip
  cluster_worker1_internal_ip = var.cluster1_worker1_internal_ip
  cluster_worker2_internal_ip = var.cluster1_worker2_internal_ip
  cni_playbook_path = var.cni_playbook_path
  cluster = "cluster1"
}

module "configure-regionA-cluster2" {
  source = "../configure-auxcluster"

  cluster_master_ip = var.cluster2_master_public_ip
  cluster_worker1_ip = var.cluster2_worker1_public_ip
  cluster_master_internal_ip = var.cluster2_master_internal_ip
  cluster_worker1_internal_ip = var.cluster2_worker1_internal_ip
  cni_playbook_path = var.cni_playbook_path
  cluster = "cluster2"
}
module "configure-regionB-cluster" {
  count = 1
  source = "../configure-auxcluster"

  cluster_master_ip = var.cluster3_master_public_ip
  cluster_worker1_ip = var.cluster3_worker1_public_ip
  cluster_master_internal_ip = var.cluster3_master_internal_ip
  cluster_worker1_internal_ip = var.cluster3_worker1_internal_ip
  cni_playbook_path = var.cni_playbook_path
  cluster = "cluster3"
}

#use root module with kv store of cnis with v being path to manifest
#create new module to take on configuration responsibilities and leave this as the provision 3 cluster module
module "test-suite" {
  depends_on = [module.configure-regionA-cluster1, module.configure-regionA-cluster2, module.configure-regionB-cluster]
  source = "../test-suite"
  count = 1

  cluster = "cluster${count.index+1}"
  cluster_master_ip = var.cluster1_master_public_ip
  cluster_worker1_ip = var.cluster1_worker1_public_ip
  cluster_worker2_ip = var.cluster1_worker2_public_ip
  cluster_master_internal_ip = var.cluster1_master_internal_ip
  cluster_worker1_internal_ip = var.cluster1_worker1_internal_ip
  cluster_worker2_internal_ip = var.cluster1_worker2_internal_ip
  cluster1_master_public_ip = var.cluster1_master_public_ip
  cluster2_master_public_ip = var.cluster2_master_public_ip
  cluster3_master_public_ip = var.cluster3_master_public_ip
  cni = var.cni
}

module "reset-nodes" {
    depends_on = [module.test-suite]
    source = "../run-playbook"
    for_each = local.nodes
    target_host = each.value
    playbook = var.reset_node_playbook_path
    cluster_master_ip = var.cluster3_master_public_ip
    cluster_worker1_ip = var.cluster3_worker1_public_ip
    cluster_master_internal_ip = var.cluster3_master_internal_ip
    cluster_worker1_internal_ip = var.cluster3_worker1_internal_ip
    cluster = "cluster1"
}