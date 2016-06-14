provider "google" {
  project       = "hashicontest-bk5tc7"
}

resource "google_compute_instance" "test1" {

  project      = "hashicontest-bk5tc7"
  name         = "bk5tc7-terraform-assignment2-1"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"
  disk {
	image = "debian-7-wheezy-v20160301"
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance" "test2" {

  project      = "hashicontest-bk5tc7"
  name         = "bk5tc7-terraform-assignment2-2"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"
  disk {
        image = "debian-7-wheezy-v20160301"
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance_group" "test" {
  name        = "bk5tc7-terraform-assignment2"
  description = "Terraform test instance group"

  instances = [
    "${google_compute_instance.test1.self_link}",
    "${google_compute_instance.test2.self_link}"
  ]

  named_port {
    name = "http"
    port = "8080"
  }

  named_port {
    name = "https"
    port = "8443"
  }

  zone = "europe-west1-b"
}
