FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update \
    && apt-get install -y openssh-server sudo docker.io \
    && rm -rf /var/lib/apt/lists/*

# Create user 'term' with password 'term' and add to sudo and docker groups
RUN useradd -m -d /home/term -s /bin/bash term \
    && echo "term:term" | chpasswd \
    && adduser term sudo \
    && usermod -aG docker term

# Expose SSH port
EXPOSE 22

# Start SSH server and Docker daemon in the background
RUN service ssh start
CMD ["/usr/sbin/sshd -D & dockerd > /dev/null 2>&1 &"]
