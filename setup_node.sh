#!/bin/bash

# ==========================================
# Hey I am Halo! 
# Twitter: budavlebac1
# ==========================================
# Sloth Image (ASCII Art)
# ==========================================
echo "Hey I am Halo! Follow me on Twitter: budavlebac1"
echo "Here's a sloth for you:"

# Sloth ASCII Art
cat << "EOF"
  ___
 ( o,o )
 { `" }
 -"--"-
EOF

# Function to install screen if not already installed
install_screen() {
    if ! command -v screen &> /dev/null; then
        echo "Installing screen..."
        sudo apt update
        sudo apt install -y screen
    else
        echo "Screen is already installed."
    fi
}

# Function to clone the repository
clone_repository() {
    if [ ! -d "node-utils" ]; then
        echo "Cloning the repository..."
        git clone https://github.com/storyprotocol/node-utils.git
    else
        echo "Repository already cloned."
    fi
}

# Function to run geth
run_geth() {
    echo "Running geth..."

    # Create a screen session for geth
    screen -S geth -dm bash -c 'cd node-utils/story-node-cli/linux && chmod +x run_commands.sh && sudo bash run_commands.sh && sleep 5 && echo 1'
}

# Function to run iliad
run_iliad() {
    echo "Running iliad..."

    # Create a screen session for iliad
    screen -S iliad -dm bash -c 'cd node-utils/story-node-cli/linux && sudo bash run_commands.sh && sleep 5 && echo 2 && echo ABCName'
}

# Main script execution
install_screen
clone_repository
run_geth
run_iliad

echo "Node setup is complete. Use 'screen -r geth' and 'screen -r iliad' to view the logs."
