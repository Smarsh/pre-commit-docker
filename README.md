# pre-commit-docker
A Docker image that runs pre-commits on your code.

# Install
Please see [Code Validation](https://github.com/Smarsh/smarsh-tools/blob/master/docs/qa.md#code-validation)
for installation instructions.

# Remove Githook
```bash
git config --unset core.hooksPath
```

# Re-add Githook
```bash
git config core.hooksPath .githooks
```
