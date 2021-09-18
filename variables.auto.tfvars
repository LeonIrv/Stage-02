project_id                        = "epam-demo-325303"
gke_network_name                  = "demo-network"
vpc_auto_create_subnetworks       = false
vpc_mtu                           = 1460
gke_subnetwork_name               = "demo-subnet"
gke_subnet_ip                     = "10.232.0.0/20"
gke_subnet_private_access         = "true"
gke_pod_range                     = "pod-ip-range"
gke_service_range                 = "service-ip-range"
gke_ip_cidr_range_pod             = "10.0.0.0/16"
gke_ip_cidr_range_service         = "10.10.0.0/20"
gke_privade_block_name            = "private-ip-block"
gke_privade_block_purpose         = "VPC_PEERING"
gke_privade_block_address_type    = "INTERNAL"
gke_privade_block_ip_version      = "IPV4"
gke_privade_block_prefix_length   = 20
gke_networking_connection_service = "servicenetworking.googleapis.com"
gke_firewall_rule                 = "allow-ssh"
gke_firewall_direction            = "INGRESS"
gke_firewall_protocol             = "tcp"
gke_firewall_port                 = "22"
gke_region                        = "us-central1"
gcp_region                        = "us-central1"
uniform_bucket_level_access       = true
force_destroy                     = true
bucket_name                       = "epam-demobk-2"
sa_account_id                     = "proxy-sa"
sa_display_name                   = "proxy-sa"
sa_role                           = "roles/cloudsql.editor"
db_region                         = "us-central1"
sql_username                      = "ram"
sql_user_password                 = "hola"
database_name                     = "gcp_training"
sql_private_network               = "projects/epam-demo-325303/global/networks/demo-network"
sql_charset                       = "utf8"
db_tier                           = "db-n1-standard-1"
db_version                        = "MYSQL_5_6"
gke_custler_name                  = "epam-cluster"
gke_regional                      = false
gke_zones                         = ["us-central1-b"]
gke_location                      = "us-central1-b"
gke_horizontal_autoscaling        = false
gke_load_balancer                 = false
gke_node_pool_name                = "gke-epam-node"
gke_service_account               = "gke-service-account@epam-demo-325303.iam.gserviceaccount.com"
gke_disk_type                     = "pd-standard"
gke_machine_type                  = "n1-standard-1"
gke_nat_name                      = "gke-nat"
gke_router_name                   = "gke-router"
