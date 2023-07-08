provider "google" {
  credentials = file("/home/luhurfatah/Files/skripsi/keys/skripsi-392008-629bb9a3e85d.json")
  project     = "skripsi-392008"
  region      = "us-east1"
  zone        = "us-east1-b"
}

resource "google_compute_disk" "openstack01_os" {
  name  = "openstack01-os"
  type  = "pd-balanced"
  zone  = "us-central1-b"
  size  = "10"
  image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230630"
}

resource "google_compute_disk" "openstack02_os" {
  name  = "openstack02-os"
  type  = "pd-balanced"
  zone  = "us-central1-b"
  size  = "10"
  image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230630"
}

resource "google_compute_disk" "ceph01_os" {
  name  = "ceph01-os"
  type  = "pd-balanced"
  zone  = "us-east1-b"
  size  = "10"
  image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230630"
}
resource "google_compute_disk" "ceph01_disk1" {
  name = "ceph01-disk1"
  type = "pd-ssd"
  zone = "us-east1-b"
  size = "10"
}

resource "google_compute_disk" "ceph01_disk2" {
  name = "ceph01-disk2"
  type = "pd-ssd"
  zone = "us-east1-b"
  size = "10"
}

resource "google_compute_disk" "ceph02_os" {
  name  = "ceph02-os"
  type  = "pd-balanced"
  zone  = "us-west4-b"
  size  = "10"
  image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230630"
}

resource "google_compute_disk" "ceph02_disk1" {
  name = "ceph02-disk1"
  type = "pd-ssd"
  zone = "us-west4-b"
  size = "10"
}

resource "google_compute_disk" "ceph02_disk2" {
  name = "ceph02-disk2"
  type = "pd-ssd"
  zone = "us-west4-b"
  size = "10"
}

resource "google_compute_disk" "glusterfs01_os" {
  name  = "glusterfs01-os"
  type  = "pd-balanced"
  zone  = "us-east1-b"
  size  = "10"
  image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230630"
}


resource "google_compute_disk" "glusterfs01_disk1" {
  name = "glusterfs01-disk1"
  type = "pd-ssd"
  zone = "us-east1-b"
  size = "10"
}

resource "google_compute_disk" "glusterfs01_disk2" {
  name = "glusterfs01-disk2"
  type = "pd-ssd"
  zone = "us-east1-b"
  size = "10"
}

resource "google_compute_disk" "glusterfs02_os" {
  name  = "glusterfs02-os"
  type  = "pd-balanced"
  zone  = "us-west4-b"
  size  = "10"
  image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230630"
}
resource "google_compute_disk" "glusterfs02_disk1" {
  name = "glusterfs02-disk1"
  type = "pd-ssd"
  zone = "us-west4-b"
  size = "10"
}

resource "google_compute_disk" "glusterfs02_disk2" {
  name = "glusterfs02-disk2"
  type = "pd-ssd"
  zone = "us-west4-b"
  size = "10"
}
