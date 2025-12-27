#!/bin/bash
# Setup new startup cloud infrastructure.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DEPENDENCY_ERROR_CODE=1

# ==============================================================================
# 1. Check Dependencies
# ==============================================================================

"$SCRIPT_DIR/internal/check_dependencies/check_git.sh" || exit ${DEPENDENCY_ERROR_CODE}
"$SCRIPT_DIR/internal/check_dependencies/check_terraform.sh" || exit ${DEPENDENCY_ERROR_CODE}
"$SCRIPT_DIR/internal/check_dependencies/check_aws.sh" || exit ${DEPENDENCY_ERROR_CODE}
