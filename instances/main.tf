provider "google" {
  credentials = file("/home/luhurfatah/Files/skripsi/keys/skripsi-392008-629bb9a3e85d.json")
  project     = "skripsi-392008"
  region      = "us-east1"
  zone        = "us-east1-b"
}

resource "google_compute_instance" "controller" {
  name         = "controller"
  machine_type = "e2-highcpu-4"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-east1/subnetworks/openstack"
    network_ip = "10.10.10.10"
    access_config {
      // To enable external NAT, remove the "nat_ip" block.
    }
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "MIGRATE"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
    echo "Hello, World!"
  EOF

}

resource "google_compute_instance" "openstack-compute1" {
  name         = "openstack-compute1"
  machine_type = "e2-highcpu-8"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-east1/subnetworks/openstack"
    network_ip = "10.10.10.20"
    access_config {
      // To enable external NAT, remove the "nat_ip" block.
    }
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "MIGRATE"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
    echo "Hello, World!"
  EOF

}

resource "google_compute_instance" "openstack-compute2" {
  name         = "openstack-compute2"
  machine_type = "e2-highcpu-8"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-east1/subnetworks/openstack"
    network_ip = "10.10.10.30"
    access_config {
      // To enable external NAT, remove the "nat_ip" block.
    }
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "MIGRATE"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
    echo "Hello, World!"
  EOF

}

resource "google_compute_instance" "ceph-node1" {
  name         = "ceph-node1"
  machine_type = "e2-highcpu-4"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  attached_disk {
    source      = "projects/skripsi-392008/zones/us-east1-b/disks/ceph01-disk1"
    device_name = "ceph01-disk1"
  }
  attached_disk {
    source      = "projects/skripsi-392008/zones/us-east1-b/disks/ceph01-disk2"
    device_name = "ceph01-disk2"
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-east1/subnetworks/ceph"
    network_ip = "10.10.20.10"
    access_config {
      // To enable external NAT, remove the "nat_ip" block.
    }
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "MIGRATE"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
    echo "Hello, World!"
  EOF

}

resource "google_compute_instance" "ceph-node2" {
  name         = "ceph-node1"
  machine_type = "e2-highcpu-4"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  attached_disk {
    source      = "projects/skripsi-392008/zones/us-east1-b/disks/ceph02-disk1"
    device_name = "ceph02-disk1"
  }
  attached_disk {
    source      = "projects/skripsi-392008/zones/us-east1-b/disks/ceph02-disk2"
    device_name = "ceph02-disk2"
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-east1/subnetworks/ceph"
    network_ip = "10.10.20.20"
    access_config {
      // To enable external NAT, remove the "nat_ip" block.
    }
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "MIGRATE"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
    echo "Hello, World!"
  EOF

}

resource "google_compute_instance" "glusterfs-node1" {
  name         = "glusterfs-node1"
  machine_type = "e2-highcpu-4"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  attached_disk {
    source      = "projects/skripsi-392008/zones/us-east1-b/disks/glusterfs01-disk1"
    device_name = "glusterfs01-disk1"
  }
  attached_disk {
    source      = "projects/skripsi-392008/zones/us-east1-b/disks/glusterfs01-disk2"
    device_name = "glusterfs01-disk2"
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-east1/subnetworks/glusterfs"
    network_ip = "10.10.30.10"
    access_config {
      // To enable external NAT, remove the "nat_ip" block.
    }
  }


  scheduling {
    automatic_restart   = false
    on_host_maintenance = "MIGRATE"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
    echo "Hello, World!"
  EOF

}

resource "google_compute_instance" "glusterfs-node2" {
  name         = "glusterfs-node2"
  machine_type = "e2-highcpu-4"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  attached_disk {
    source      = "projects/skripsi-392008/zones/us-east1-b/disks/glusterfs02-disk1"
    device_name = "glusterfs02-disk1"
  }
  attached_disk {
    source      = "projects/skripsi-392008/zones/us-east1-b/disks/glusterfs02-disk2"
    device_name = "glusterfs02-disk2"
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-east1/subnetworks/glusterfs"
    network_ip = "10.10.30.20"
    access_config {
      // To enable external NAT, remove the "nat_ip" block.
    }
  }


  scheduling {
    automatic_restart   = false
    on_host_maintenance = "MIGRATE"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
    echo "Hello, World!"
  EOF

}












