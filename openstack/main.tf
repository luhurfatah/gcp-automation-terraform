provider "google" {
  credentials = file("/home/luhurfatah/Files/skripsi/keys/skripsi-392008-629bb9a3e85d.json")
  project     = "skripsi-392008"
}

resource "google_compute_instance" "openstack-node1" {
  name         = "openstack-node01"
  machine_type = "e2-highcpu-4"
  zone         = "us-central1-b"

  boot_disk {
    auto_delete = false
    device_name = "ceph01-os"
    mode        = "READ_WRITE"
    source      = "projects/skripsi-392008/zones/us-central1-b/disks/openstack01-os"
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-central1/subnetworks/central1"
    network_ip = "10.10.30.10"
    access_config {
      nat_ip       = "104.198.156.131"
      network_tier = "PREMIUM"
    }

  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "MIGRATE"
  }

  metadata = {
    ssh-keys = "luhurfatah:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAKJOiWoZ5tCyBzKJHwM4BHmnbNbonrM5G0jIRez3nLnfrX5pyToH5UqEr3OiRdbW168h9mBNVKRgE1y1zp17dVy8PN7zndzsNoAPUulhgwdJjpwDJqxepfSWuf6t5ZsV772sJRbNxSkV8zniahONscoUFXMyhAHdJ34Ccwq6Ke+WrPedwmQ8kH+VFqd8gUDDV6QlgJfNaGFXyFsYDFS1p/f05BnfAssb3mQzv3UyQvxQi8tIA0DkrhKZVmFFiF9tbq3bi1WA8koLffoFsfWauIPNoudG+m4alTU8MgBbgtDfKYnLrXIl5v/XfaNCq9U0SLT+VkdOUhQ0aSZ/0Jp6wjZd7dRrjzAeKt7o4O/0F6u0OXtu1AKcNevQAoknJjRs8/beOVGx49QVNJk0heV5GK+objXsCLBxggaGJOprM7YOnT71ScvAHasOlBSXoFXuhO57TdtblF+K+9dGgI4Cn6bwmffpv/RG6c6JbalqRrBCYv4vOi/VmKT/9njNSPUs= luhurfatah@lzy"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
    echo "Hello, World!"
  EOF

}

resource "google_compute_instance" "openstack-node2" {
  name         = "openstack-node02"
  machine_type = "e2-highcpu-4"
  zone         = "us-central1-b"

  boot_disk {
    auto_delete = false
    device_name = "ceph01-os"
    mode        = "READ_WRITE"
    source      = "projects/skripsi-392008/zones/us-central1-b/disks/openstack02-os"
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-central1/subnetworks/central1"
    network_ip = "10.10.30.11"
  }

  scheduling {
    automatic_restart   = false
    on_host_maintenance = "MIGRATE"
  }

  metadata = {
    ssh-keys = "luhurfatah:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAKJOiWoZ5tCyBzKJHwM4BHmnbNbonrM5G0jIRez3nLnfrX5pyToH5UqEr3OiRdbW168h9mBNVKRgE1y1zp17dVy8PN7zndzsNoAPUulhgwdJjpwDJqxepfSWuf6t5ZsV772sJRbNxSkV8zniahONscoUFXMyhAHdJ34Ccwq6Ke+WrPedwmQ8kH+VFqd8gUDDV6QlgJfNaGFXyFsYDFS1p/f05BnfAssb3mQzv3UyQvxQi8tIA0DkrhKZVmFFiF9tbq3bi1WA8koLffoFsfWauIPNoudG+m4alTU8MgBbgtDfKYnLrXIl5v/XfaNCq9U0SLT+VkdOUhQ0aSZ/0Jp6wjZd7dRrjzAeKt7o4O/0F6u0OXtu1AKcNevQAoknJjRs8/beOVGx49QVNJk0heV5GK+objXsCLBxggaGJOprM7YOnT71ScvAHasOlBSXoFXuhO57TdtblF+K+9dGgI4Cn6bwmffpv/RG6c6JbalqRrBCYv4vOi/VmKT/9njNSPUs= luhurfatah@lzy"
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
    echo "Hello, World!"
  EOF

}













