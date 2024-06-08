#!/bin/bash

# Variables
GITHUB_REPO_URL="https://raw.githubusercontent.com/yourusername/my-js-ts-setup/main"
PLAYBOOKS=("common.yaml" "nodejs.yaml" "js_ts_packages.yaml" "vscode-extensions.yaml")
CONFIG_FILES=("js_ts_tools.yaml" "vscode_extensions.yaml")

# Check if the script is run with sudo
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

DIRNAME=$(dirname "$0")
TMP_DIR=$(sudo -u "$SUDO_USER" mktemp -d)
sudo -u "$SUDO_USER" mkdir -p "$TMP_DIR/playbooks/vars"

# Ensure cleanup on exit
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Install Ansible if not already installed
if ! command -v curl &> /dev/null; then
  sudo apt update
  sudo apt install -y curl
fi

# Function to copy or download files
copy_or_download() {
  local file="$DIRNAME/$1"
  local url="$GITHUB_REPO_URL/$2"
  if [[ -f $file ]]; then
    echo "$1 found locally. Copying to $TMP_DIR..."
    sudo -u "$SUDO_USER" cp "$file" "$TMP_DIR/$1"
  else
    echo "$1 not found locally. Downloading from $url..."
    sudo -u "$SUDO_USER" curl -fsSL "$url" -o "$TMP_DIR/$1"
  fi
}

# Copy or download playbooks
echo "Setting up the environment..."
for playbook in "${PLAYBOOKS[@]}"; do
  copy_or_download "playbooks/$playbook" "playbooks/$playbook"
done

# Copy or download config files
echo "Setting up the configuration..."
for config_file in "${CONFIG_FILES[@]}"; do
  copy_or_download "playbooks/vars/$config_file" "playbooks/vars/$config_file"
done

# Install Ansible if not already installed
echo "Checking Ansible installation..."
if ! command -v ansible &> /dev/null; then
    echo "Ansible is not installed. Installing Ansible..."
    sudo apt update
    sudo apt install -y ansible
fi

# Ensure ansible can be run as the sudo user
if ! sudo -u "$SUDO_USER" ansible --version > /dev/null 2>&1; then
  echo "Ansible could not be found or executed. Please check your Ansible installation."
  exit 1
fi

# Run Ansible playbooks as the sudo user
echo "Installing tools..."
ls -l "$TMP_DIR/playbooks"
sudo -u "$SUDO_USER"  ansible-playbook "$TMP_DIR/playbooks/nodejs.yaml"
echo "Installing packages..."
sudo -u "$SUDO_USER"  ansible-playbook "$TMP_DIR/playbooks/js_ts_packages.yaml"
echo "Installing VSCode extensions..."
sudo -u "$SUDO_USER"  ansible-playbook "$TMP_DIR/playbooks/vscode-extensions.yaml"
echo "All checks passed! Installation complete."
