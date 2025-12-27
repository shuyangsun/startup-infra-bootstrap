#!/bin/bash
# Common definitions for setup scripts.

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Symbols
CHECK="${GREEN}✓${NC}"
CROSS="${RED}✗${NC}"

# Helper functions
success() {
    echo -e "${CHECK} $1"
}

error() {
    echo -e "${CROSS} $1"
}
