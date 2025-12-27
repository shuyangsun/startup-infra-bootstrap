#!/bin/bash
# Check Terraform installation and version.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../common.sh"

REQUIRED_TERRAFORM_VERSION="1.14.3"

echo "Checking Terraform installation..."
if ! command -v terraform &> /dev/null; then
    error "Terraform is not installed. Please install Terraform $REQUIRED_TERRAFORM_VERSION or above."
    exit 1
fi

TERRAFORM_VERSION=$(terraform -version | head -n 1 | sed 's/Terraform v//')

# Compare versions
if [ "$(printf '%s\n' "$REQUIRED_TERRAFORM_VERSION" "$TERRAFORM_VERSION" | sort -V | head -n1)" != "$REQUIRED_TERRAFORM_VERSION" ]; then
    error "Terraform version $TERRAFORM_VERSION is below the required version $REQUIRED_TERRAFORM_VERSION"
    exit 1
fi
success "Terraform version $TERRAFORM_VERSION is installed."
