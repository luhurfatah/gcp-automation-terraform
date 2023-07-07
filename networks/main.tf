provider "google" {
  credentials = file("/home/luhurfatah/Files/skripsi/keys/skripsi-392008-629bb9a3e85d.json")
  project     = "skripsi-392008"
  region      = "us-east1"
  zone        = "us-east1-b"
}

resource "google_compute_network" "vpc_network" {
  name                    = "internal-network"
  auto_create_subnetworks = false
  project                 = "skripsi-392008"
}

resource "google_compute_subnetwork" "openstack" {
  name          = "openstack"
  ip_cidr_range = "10.10.10.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "ceph" {
  name          = "ceph"
  ip_cidr_range = "10.10.20.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "glusterfs" {
  name          = "glusterfs"
  ip_cidr_range = "10.10.30.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  project = "skripsi-392008"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-internal" {
  name    = "allow-internal"
  project = "skripsi-392008"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["1-65535"]
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24"]
}

module "openstack-address" {
  source     = "terraform-google-modules/address/google"
  version    = "~> 3.1"
  project_id = "skripsi-392008"
  region     = "us-east1"
  subnetwork = "openstack"
  names      = ["controller", "openstack-compute1", "openstack-compute2"]
  addresses  = ["10.10.10.10", "10.10.10.20", "10.10.10.30"]
  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.openstack
  ]
}

module "ceph-address" {
  source     = "terraform-google-modules/address/google"
  version    = "~> 3.1"
  project_id = "skripsi-392008"
  region     = "us-east1"
  subnetwork = "ceph"
  names      = ["ceph-node1", "ceph-node2"]
  addresses  = ["10.10.20.10", "10.10.20.20"]
  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.ceph
  ]
}

module "glusterfs-address" {
  source     = "terraform-google-modules/address/google"
  version    = "~> 3.1"
  project_id = "skripsi-392008"
  region     = "us-east1"
  subnetwork = "glusterfs"
  names      = ["glusterfs-node1", "glusterfs-node2"]
  addresses  = ["10.10.30.10", "10.10.30.20"]
  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.glusterfs
  ]
}
