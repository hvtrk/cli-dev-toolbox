# Development Guide

## Setting Up Development Environment

### Prerequisites

- Python 3.10 or higher
- pip
- git

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/rahulkumar/cli-dev-toolbox.git
   cd cli-dev-toolbox
   ```

2. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install development dependencies:
   ```bash
   pip install -e ".[dev]"
   ```

4. Install pre-commit hooks:
   ```bash
   pre-commit install
   ```

## Development Workflow

### Code Style

This project uses:
- **Black** for code formatting
- **Flake8** for linting
- **MyPy** for type checking
- **isort** for import sorting

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=cli_dev_toolbox

# Run specific test file
pytest tests/test_basic.py

# Run with verbose output
pytest -v
```

### Code Quality Checks

```bash
# Format code
black .

# Check code style
flake8

# Type checking
mypy cli_dev_toolbox/

# Sort imports
isort .
```

### Pre-commit Hooks

The project uses pre-commit hooks to ensure code quality. These run automatically on commit, but you can also run them manually:

```bash
pre-commit run --all-files
```

## Adding New Features

1. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes following the coding standards

3. Add tests for your new functionality

4. Update documentation if needed

5. Run all checks:
   ```bash
   pre-commit run --all-files
   pytest
   ```

6. Commit your changes:
   ```bash
   git add .
   git commit -m "Add your feature description"
   ```

7. Push and create a pull request

## Testing Guidelines

### Test Structure

- Tests should be in the `tests/` directory
- Test files should be named `test_*.py`
- Test functions should be named `test_*`
- Use pytest fixtures for common setup

### Test Coverage

- Aim for at least 80% code coverage
- Test both success and error cases
- Test edge cases and boundary conditions

### Example Test

```python
import pytest
from cli_dev_toolbox.converters import json_to_csv

def test_json_to_csv_success(tmp_path):
    """Test successful JSON to CSV conversion."""
    # Setup
    json_data = [{"name": "Alice", "age": 30}, {"name": "Bob", "age": 25}]
    json_file = tmp_path / "test.json"
    csv_file = tmp_path / "test.csv"

    # Write test JSON file
    with open(json_file, "w") as f:
        json.dump(json_data, f)

    # Execute
    json_to_csv(str(json_file), str(csv_file))

    # Assert
    assert csv_file.exists()
    # Add more assertions as needed
```

## Building and Distribution

### Building the Package

```bash
# Build source distribution
python -m build

# Build wheel
python -m build --wheel
```

### Testing the Build

```bash
# Install from built package
pip install dist/*.whl

# Test the installation
cli-dev-toolbox --help
```

### Publishing to PyPI

1. Build the package:
   ```bash
   python -m build
   ```

2. Check the build:
   ```bash
   twine check dist/*
   ```

3. Upload to TestPyPI (for testing):
   ```bash
   twine upload --repository testpypi dist/*
   ```

4. Upload to PyPI:
   ```bash
   twine upload dist/*
   ```

## Version Management

### Semantic Versioning

This project follows [Semantic Versioning](https://semver.org/):
- MAJOR.MINOR.PATCH
- MAJOR: Incompatible API changes
- MINOR: New functionality in a backward-compatible manner
- PATCH: Backward-compatible bug fixes

### Updating Version

1. Update version in `pyproject.toml`
2. Update version in `cli_dev_toolbox/__init__.py`
3. Update `CHANGELOG.md`
4. Create a git tag

## Contributing

### Pull Request Process

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Update documentation
6. Run all checks
7. Submit a pull request

### Code Review

All pull requests require:
- Passing tests
- Code coverage maintained or improved
- Documentation updated
- Code style compliance

## Troubleshooting

### Common Issues

1. **Import errors**: Make sure you're in the virtual environment
2. **Test failures**: Check that all dependencies are installed
3. **Pre-commit failures**: Run `pre-commit run --all-files` to see detailed errors

### Getting Help

- Check existing issues on GitHub
- Create a new issue with detailed information
- Include error messages and steps to reproduce
