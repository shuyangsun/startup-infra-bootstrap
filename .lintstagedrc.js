const path = require('path');

module.exports = {
  "*.md": "prettier --write",
  "*.tf": [
    "terraform fmt",
    (filenames) => {
      const dirs = [...new Set(filenames.map(file => path.dirname(file)))];
      return dirs.map(dir => `tflint --chdir=${dir}`);
    }
  ]
}
