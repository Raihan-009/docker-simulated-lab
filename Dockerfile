FROM ubuntu:latest

# Update package repositories and install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server sudo docker.io && \
    rm -rf /var/lib/apt/lists/*

# Create user 'term' with password 'term' and add to sudo group
RUN useradd -m -d /home/term -s /bin/bash term && \
    echo "term:term" | chpasswd && \
    adduser term sudo

# Expose SSH port
EXPOSE 22

# Start SSH server
RUN service ssh start
CMD ["/usr/sbin/sshd", "-D"]
