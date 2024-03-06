FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update \
    && apt-get install -y openssh-server sudo docker.io \
    && rm -rf /var/lib/apt/lists/*

# Create user 'term' with password 'term' and add to sudo group
RUN useradd -m -d /home/term -s /bin/bash term \
    && echo "term:term" | chpasswd \
    && adduser term sudo

# Expose SSH port
EXPOSE 22

# Set the user to root
USER root

# Start SSH server
RUN service ssh start
CMD ["/usr/sbin/sshd", "-D"]