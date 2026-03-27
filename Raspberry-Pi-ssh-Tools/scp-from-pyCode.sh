#!/bin/bash

# --- Configuration ---
PI_USER="pi"
PI_HOST="192.168.1.50"        # or use "raspberrypi.local"
REMOTE_DIR="/home/pi/mydata"
LOCAL_DIR="/c/Users/YourName/Downloads/pi_files"

# --- Create local destination if it doesn't exist ---
mkdir -p "$LOCAL_DIR"

# --- Copy files ---
scp -r "$PI_USER@$PI_HOST:$REMOTE_DIR/" "$LOCAL_DIR"

echo "Done! Files copied to $LOCAL_DIR"
