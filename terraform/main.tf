terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "google" {
  project = "devops-internship-project"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "web_server" {
  name         = "devops-web-server"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  tags = ["web-server"]

  metadata_startup_script = <<-EOF
    #!/bin/bash

    apt-get update -y
    apt-get install -y docker.io

    systemctl enable docker
    systemctl start docker

    usermod -aG docker $USER
  EOF
}

output "instance_id" {
  description = "GCP Compute Engine instance ID"
  value       = google_compute_instance.web_server.id
}

output "instance_name" {
  description = "GCP Compute Engine instance name"
  value       = google_compute_instance.web_server.name
}

output "instance_public_ip" {
  description = "Public IP address of the GCP VM"
  value       = google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip
}

output "application_url" {
  description = "Application URL"
  value       = "http://${google_compute_instance.web_server.network_interface[0].access_config[0].nat_ip}:3000"
}