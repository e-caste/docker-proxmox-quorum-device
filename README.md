# docker-proxmox-quorum-device

To add a Docker container as a Proxmox `qdevice` (useful in evenly numbered clusters) run the following process:
1. uncomment the port 22 line in `docker-compose.yml`
2. on the Docker host run `docker compose up --build -d`
3. on one of your Proxmox nodes run `pvecm qdevice setup <Docker host IP>` and login with the container's root password `securepassword`
4. (optional) check with `pvecm status` that everything has worked out correctly
5. comment the port 22 line in `docker-compose.yml`
6. on the Docker host run `docker compose up --build -d`

You can find all the Proxmox docs [here](https://pve.proxmox.com/pve-docs/pve-admin-guide.html#_corosync_external_vote_support) and linked in the repo files.
