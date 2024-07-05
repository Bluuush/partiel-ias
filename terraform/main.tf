resource "google_compute_instance" "default" {
  name         = "terraform-ias"
  machine_type = "e2-small"
  zone         = "europe-west3-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Install systemd service file
    cat <<EOF > /etc/systemd/system/api.service
    [Unit]
    Description=API Service
    After=network.target

    [Service]
    ExecStart=/usr/bin/node /opt/myapp/app.js  # Commande de démarrage de votre application GCP
    Restart=always
    RestartSec=3
    User=your_app_user  # Remplacez par l'utilisateur approprié
    Group=your_app_group  # Remplacez par le groupe approprié

    [Install]
    WantedBy=multi-user.target
    EOF

    # Reload systemd
    systemctl daemon-reload

    # Enable and start the service
    systemctl enable api.service
    systemctl start api.service
  EOF
}
