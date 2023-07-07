provider "google" {
  credentials = file("/home/luhurfatah/Files/skripsi/keys/skripsi-392008-629bb9a3e85d.json")
  project     = "skripsi-392008"
  region      = "us-east1"
  zone        = "us-east1-b"
}

resource "google_compute_instance" "spot-instance" {
  name         = "spot-instance"
  machine_type = "e2-highcpu-4"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-net"
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




