provider "google" {
  credentials = file("/home/luhurfatah/Files/skripsi/keys/skripsi-392008-629bb9a3e85d.json")
  project     = "skripsi-392008"
}


resource "google_compute_instance" "ceph-east1" {
  name         = "ceph-east1"
  machine_type = "e2-highcpu-2"
  zone         = "us-east1-b"

  boot_disk {
    auto_delete = false
    device_name = "ceph01-os"
    mode        = "READ_WRITE"
    source      = "projects/skripsi-392008/zones/us-east1-b/disks/ceph01-os"
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
    subnetwork = "projects/skripsi-392008/regions/us-east1/subnetworks/east1"
    network_ip = "10.10.10.20"
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

resource "google_compute_instance" "ceph-west4" {
  name         = "ceph-west4"
  machine_type = "e2-highcpu-2"
  zone         = "us-west4-b"

  boot_disk {
    auto_delete = false
    device_name = "ceph01-os"
    mode        = "READ_WRITE"
    source      = "projects/skripsi-392008/zones/us-west4-b/disks/ceph02-os"
  }

  attached_disk {
    source      = "projects/skripsi-392008/zones/us-west4-b/disks/ceph02-disk1"
    device_name = "ceph02-disk1"
  }
  attached_disk {
    source      = "projects/skripsi-392008/zones/us-west4-b/disks/ceph02-disk2"
    device_name = "ceph02-disk2"
  }

  network_interface {
    network    = "projects/skripsi-392008/global/networks/internal-network"
    subnetwork = "projects/skripsi-392008/regions/us-west4/subnetworks/west4"
    network_ip = "10.10.20.20"
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






