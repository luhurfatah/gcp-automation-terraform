provider "google" {
  credentials = file("/home/luhurfatah/Files/skripsi/keys/skripsi-392008-629bb9a3e85d.json")
  project     = "skripsi-392008"
}

resource "google_compute_network" "vpc_network" {
  name                    = "internal-network"
  auto_create_subnetworks = false
  project                 = "skripsi-392008"
}

resource "google_compute_subnetwork" "east1" {
  name          = "east1"
  ip_cidr_range = "10.10.10.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "west4" {
  name          = "west4"
  ip_cidr_range = "10.10.20.0/24"
  region        = "us-west4"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "central1" {
  name          = "central1"
  ip_cidr_range = "10.10.30.0/24"
  region        = "us-central1"
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
  region     = "us-central1"
  subnetwork = "central1"
  names      = ["openstack-node1", "openstack-node2"]
  addresses  = ["10.10.30.10", "10.10.30.11"]
  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.east1,
    google_compute_subnetwork.west4,
    google_compute_subnetwork.central1,
  ]
}

module "east1-address" {
  source     = "terraform-google-modules/address/google"
  version    = "~> 3.1"
  project_id = "skripsi-392008"
  region     = "us-east1"
  subnetwork = "east1"
  names      = ["ceph-east1", "glusterfs-east1"]
  addresses  = ["10.10.10.20", "10.10.10.30"]
  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.east1,
    google_compute_subnetwork.west4,
    google_compute_subnetwork.central1,
  ]
}

module "west4-address" {
  source     = "terraform-google-modules/address/google"
  version    = "~> 3.1"
  project_id = "skripsi-392008"
  region     = "us-west4"
  subnetwork = "west4"
  names      = ["ceph-west4", "glusterfs-west4"]
  addresses  = ["10.10.20.20", "10.10.20.30"]
  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.east1,
    google_compute_subnetwork.west4,
    google_compute_subnetwork.central1,
  ]
}

