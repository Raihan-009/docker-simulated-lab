#!/bin/bash

# Copy daemon.json file
cp daemon.json /etc/docker/daemon.json

# Restart Docker daemon
service docker restart

# Start SSH daemon in the foreground
/usr/sbin/sshd -D
