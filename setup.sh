#!/bin/bash

# Check if the command exists.
# $1 is the first argument.
# Redirect standard output to be discarded.
# Also redirect standard error to be discarded.
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

print_status() {
    echo "🔍 $1"
}

print_success() {
    echo "✅ $1"
}

print_error() {
    echo "❌ $1"
}

install_homebrew() {
    print_status "Checking Homebrew installation..."
    if ! command_exists brew; then
        print_status "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH if it's not already there
        if [[ -f /opt/homebrew/bin/brew ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        
        print_success "Homebrew installed successfully!"
    else
        print_success "Homebrew is already installed!"
    fi
}

install_pip() {
    print_status "Checking pip installation..."
    if ! command_exists pip3; then
        print_status "pip not found. Installing..."
        curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
        python3 get-pip.py
        rm get-pip.py
        
        # Add pip to PATH if needed
        if [[ -d "$HOME/Library/Python/3.x/bin" ]]; then
            echo 'export PATH="$HOME/Library/Python/3.x/bin:$PATH"' >> ~/.zshrc
        fi
        
        print_success "pip installed successfully!"
    else
        print_success "pip is already installed!"
    fi
}

install_ansible() {
    print_status "Checking Ansible installation..."
    if ! command_exists ansible; then
        print_status "Ansible not found. Installing..."
        if command_exists brew; then
            brew install ansible
        else
            pip3 install --user ansible
        fi
        print_success "Ansible installed successfully!"
    else
        print_success "Ansible is already installed!"
    fi
}

main() {
    echo "🚀 Starting development environment setup..."
    
    install_homebrew
    install_pip
    install_ansible
    
    echo "✨ Setup complete! Please restart your terminal or run 'source ~/.zshrc' to apply changes."
}

main 