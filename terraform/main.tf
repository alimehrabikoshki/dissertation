
locals {
    cnis = {"calico"="/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/calico/calico_master.yaml",
            "flannel" = "/mnt/c/Users/Ali/PycharmProjects/dissertation/ansible/modules/CNIs/flannel/flannel_master.yaml"}


}

module "provision-testbed" {

  source = "./modules/provision-testbed"
  gcp_auth_file = var.gcp_auth_file
  machine_type = var.machine_type
  gcp_regionA = var.gcp_regionA
  gcp_regionB = var.gcp_regionB
  gcp_regionB_zone = var.gcp_regionB_zone
  regionA_cidr_range = var.regionA_cidr_range
  regionB_cidr_range = var.regionB_cidr_range

}

module "test-calico" {
  depends_on = [module.provision-testbed]
  source = "./modules/configure-cni"

  cni = "calico"
  cni_playbook_path = local.cnis.calico
  cluster1_master_internal_ip = module.provision-testbed.cluster1-master-ip
  cluster1_master_public_ip = module.provision-testbed.cluster1-master-public-ip
  cluster1_worker1_internal_ip = module.provision-testbed.cluster1-worker1-ip
  cluster1_worker1_public_ip = module.provision-testbed.cluster1-worker1-public-ip
  cluster1_worker2_internal_ip = module.provision-testbed.cluster1-worker2-ip
  cluster1_worker2_public_ip =  module.provision-testbed.cluster1-worker2-public-ip
  cluster2_master_internal_ip = module.provision-testbed.cluster2-master-ip
  cluster2_master_public_ip = module.provision-testbed.cluster2-master-public-ip
  cluster2_worker1_internal_ip = module.provision-testbed.cluster2-worker1-ip
  cluster2_worker1_public_ip = module.provision-testbed.cluster2-worker1-public-ip
  cluster2_worker2_internal_ip = module.provision-testbed.cluster2-worker2-ip
  cluster2_worker2_public_ip =  module.provision-testbed.cluster2-worker2-public-ip
  cluster3_master_internal_ip = module.provision-testbed.cluster3-master-ip
  cluster3_master_public_ip = module.provision-testbed.cluster3-master-public-ip
  cluster3_worker1_internal_ip = module.provision-testbed.cluster3-worker1-ip
  cluster3_worker1_public_ip = module.provision-testbed.cluster3-worker1-public-ip
  cluster3_worker2_internal_ip = module.provision-testbed.cluster3-worker2-ip
  cluster3_worker2_public_ip =  module.provision-testbed.cluster3-worker2-public-ip
}

module "test-flannel" {
  depends_on = [module.test-calico]
  source = "./modules/configure-cni"

  cni = "flannel"
  cni_playbook_path = local.cnis.flannel
  cluster1_master_internal_ip = module.provision-testbed.cluster1-master-ip
  cluster1_master_public_ip = module.provision-testbed.cluster1-master-public-ip
  cluster1_worker1_internal_ip = module.provision-testbed.cluster1-worker1-ip
  cluster1_worker1_public_ip = module.provision-testbed.cluster1-worker1-public-ip
  cluster1_worker2_internal_ip = module.provision-testbed.cluster1-worker2-ip
  cluster1_worker2_public_ip =  module.provision-testbed.cluster1-worker2-public-ip
  cluster2_master_internal_ip = module.provision-testbed.cluster2-master-ip
  cluster2_master_public_ip = module.provision-testbed.cluster2-master-public-ip
  cluster2_worker1_internal_ip = module.provision-testbed.cluster2-worker1-ip
  cluster2_worker1_public_ip = module.provision-testbed.cluster2-worker1-public-ip
  cluster2_worker2_internal_ip = module.provision-testbed.cluster2-worker2-ip
  cluster2_worker2_public_ip =  module.provision-testbed.cluster2-worker2-public-ip
  cluster3_master_internal_ip = module.provision-testbed.cluster3-master-ip
  cluster3_master_public_ip = module.provision-testbed.cluster3-master-public-ip
  cluster3_worker1_internal_ip = module.provision-testbed.cluster3-worker1-ip
  cluster3_worker1_public_ip = module.provision-testbed.cluster3-worker1-public-ip
  cluster3_worker2_internal_ip = module.provision-testbed.cluster3-worker2-ip
  cluster3_worker2_public_ip =  module.provision-testbed.cluster3-worker2-public-ip
}