# PyPI Deployment Guide

This guide provides step-by-step instructions for deploying the CLI Dev Toolbox package to PyPI.

## Prerequisites

1. **PyPI Account**: Create an account at https://pypi.org/account/register/
2. **TestPyPI Account**: Create an account at https://test.pypi.org/account/register/
3. **Two-Factor Authentication**: Enable 2FA on both accounts (recommended)

## Pre-Deployment Checklist

Before deploying, ensure all checks pass:

```bash
# Run all quality checks
make check-all

# Build the package
python -m build

# Check the built package
twine check dist/*
```

## Step 1: Test Upload to TestPyPI

First, test your package on TestPyPI to ensure everything works correctly:

```bash
# Upload to TestPyPI
twine upload --repository testpypi dist/*

# Install from TestPyPI to test
pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/ cli-dev-toolbox

# Test the installation
cli-dev-toolbox --help
```

## Step 2: Upload to PyPI

Once you've verified the package works on TestPyPI:

```bash
# Upload to PyPI
twine upload dist/*
```

## Step 3: Verify Installation

After uploading to PyPI:

```bash
# Install from PyPI
pip install cli-dev-toolbox

# Test the installation
cli-dev-toolbox --help
cli-dev-toolbox json2csv --help
cli-dev-toolbox prettyjson --help
cli-dev-toolbox fetch --help
```

## Authentication

When uploading, you'll be prompted for:
- **Username**: Your PyPI username
- **Password**: Your PyPI password (or API token if using 2FA)

### Using API Tokens (Recommended)

1. Go to https://pypi.org/manage/account/token/
2. Create a new API token
3. Use the token as your password when prompted

## Version Management

For future releases:

1. **Update version** in `pyproject.toml`:
   ```toml
   version = "0.1.1"  # Increment version
   ```

2. **Update CHANGELOG.md** with new features/fixes

3. **Build and upload**:
   ```bash
   python -m build
   twine upload dist/*
   ```

## Troubleshooting

### Common Issues

1. **Package name already exists**: Choose a different package name
2. **Authentication failed**: Check your username/password or API token
3. **Upload failed**: Ensure all files are properly included in the build

### Useful Commands

```bash
# Clean build artifacts
rm -rf build/ dist/ *.egg-info/

# Rebuild package
python -m build

# Check package contents
tar -tzf dist/*.tar.gz

# Validate package
twine check dist/*
```

## Security Best Practices

1. **Use API tokens** instead of passwords
2. **Enable 2FA** on your PyPI account
3. **Never commit credentials** to version control
4. **Use TestPyPI** for testing before production deployment

## Package Information

- **Package Name**: `cli-dev-toolbox`
- **Current Version**: `0.1.0`
- **Python Version**: `>=3.13`
- **Dependencies**: `requests>=2.31.0`
- **Entry Point**: `cli-dev-toolbox`

## Support

If you encounter issues during deployment:

1. Check the [PyPI documentation](https://packaging.python.org/guides/distributing-packages-using-setuptools/)
2. Review the [twine documentation](https://twine.readthedocs.io/)
3. Check the package build logs for errors
