FROM debian:bullseye-slim

RUN apt-get update
RUN apt-get upgrade -y
# https://pve.proxmox.com/pve-docs/chapter-pvecm.html#_qdevice_net_setup
RUN apt-get install -y corosync-qnetd openssh-server

# enable root password for ssh login
RUN echo "root:securepassword" | chpasswd

# generate host ssh keys
RUN ssh-keygen -A

# magic command
RUN service ssh start

# launch sshd as daemon
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
