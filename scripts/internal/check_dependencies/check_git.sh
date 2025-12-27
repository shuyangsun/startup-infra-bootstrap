#!/bin/bash
# Check Git installation.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../common.sh"

echo "Checking Git installation..."
if ! command -v git &> /dev/null; then
    error "Git is not installed. Please install Git."
    exit 1
fi

GIT_VERSION=$(git --version | sed 's/git version //')
success "Git version $GIT_VERSION is installed."
