# Development Guide

This guide explains how to run the CLI Dev Toolbox in development mode and set up continuous integration.

## 🚀 Quick Start for Development

### 1. Setup Development Environment

```bash
# Clone the repository
git clone https://github.com/rahulkumar/cli-dev-toolbox.git
cd cli-dev-toolbox

# Create virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install in development mode
python3 -m pip install -e ".[dev]"

# Install pre-commit hooks
pre-commit install
```

### 2. Verify Installation

```bash
# Check if CLI tool is available
cli-dev-toolbox --help

# Test with sample data
cli-dev-toolbox json2csv examples/sample_data.json test.csv
head -3 test.csv
```

## 🔧 Development Workflow

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=cli_dev_toolbox --cov-report=html

# Run specific test file
pytest tests/test_converters.py -v

# Run tests in watch mode (requires pytest-watch)
ptw
```

### Code Quality Checks

```bash
# Format code
black .
isort .

# Check code style
flake8 cli_dev_toolbox/ tests/

# Type checking
mypy cli_dev_toolbox/

# Run all checks
make check-all
```

### Using Make Commands

```bash
# Show all available commands
make help

# Install development dependencies
make install-dev

# Run tests
make test

# Run tests with coverage
make test-cov

# Format code
make format

# Lint code
make lint

# Type checking
make type-check

# Clean build artifacts
make clean

# Build package
make build
```

## 🧪 Testing

### Test Structure

- `tests/test_basic.py` - Basic functionality tests
- `tests/test_converters.py` - JSON to CSV conversion tests
- `tests/test_toolbox.py` - CLI interface tests

### Running Tests Locally

```bash
# Run all tests
pytest

# Run with verbose output
pytest -v

# Run with coverage
pytest --cov=cli_dev_toolbox --cov-report=term-missing

# Run specific test
pytest tests/test_converters.py::TestJsonToCsv::test_basic_json_to_csv

# Run tests in parallel (requires pytest-xdist)
pytest -n auto
```

### Test Data

Sample test data is available in `examples/sample_data.json`:

```bash
# Test with sample data
cli-dev-toolbox json2csv examples/sample_data.json output.csv
```

## 🔄 Continuous Integration

### GitHub Actions Workflows

The project includes two CI/CD workflows:

1. **Main CI** (`.github/workflows/ci.yml`)
   - Runs on push to `main` and `develop` branches
   - Tests against multiple Python versions (3.10, 3.11, 3.12, 3.13)
   - Runs linting, type checking, and tests
   - Builds package on main branch
   - Uploads coverage to Codecov

2. **Development Workflow** (`.github/workflows/dev.yml`)
   - Runs on feature branches and pull requests
   - Focuses on development-specific checks
   - Includes security scanning with bandit
   - Tests CLI installation and functionality

### Local CI Simulation

```bash
# Run the same checks as CI locally
make check-all

# Or run individual checks
make lint
make type-check
make test
```

## 🐛 Debugging

### Debug Mode

```bash
# Run with debug output
python -m cli_dev_toolbox.toolbox json2csv input.json output.csv

# Run tests with debug output
pytest -v -s
```

### Common Issues

1. **Import Errors**
   ```bash
   # Make sure you're in the virtual environment
   source venv/bin/activate

   # Reinstall in development mode
   pip install -e ".[dev]"
   ```

2. **Test Failures**
   ```bash
   # Check test output
   pytest -v --tb=short

   # Run specific failing test
   pytest tests/test_converters.py::TestJsonToCsv::test_basic_json_to_csv -v -s
   ```

3. **Pre-commit Hook Failures**
   ```bash
   # Run pre-commit manually
   pre-commit run --all-files

   # Skip pre-commit (not recommended)
   git commit --no-verify -m "Your message"
   ```

## 📦 Building and Distribution

### Local Build

```bash
# Build package
python -m build

# Check build
twine check dist/*

# Install from built package
pip install dist/*.whl
```

### Testing Distribution

```bash
# Test installation
pip install -e .
cli-dev-toolbox --help

# Test with sample data
cli-dev-toolbox json2csv examples/sample_data.json test.csv
```

## 🔍 Code Coverage

### View Coverage Report

```bash
# Generate HTML coverage report
pytest --cov=cli_dev_toolbox --cov-report=html

# Open coverage report
open htmlcov/index.html
```

### Coverage Targets

- **Current Coverage**: ~77%
- **Target Coverage**: 80%+
- **Critical Paths**: 90%+

## 🚀 Development Tips

### 1. Use Pre-commit Hooks

Pre-commit hooks automatically:
- Format code with Black
- Sort imports with isort
- Check code style with flake8
- Run type checking with mypy

### 2. Follow Git Workflow

```bash
# Create feature branch
git checkout -b feature/your-feature

# Make changes and commit
git add .
git commit -m "Add your feature"

# Push and create PR
git push origin feature/your-feature
```

### 3. Test Before Committing

```bash
# Run all checks before committing
make check-all

# Or run individual checks
make lint
make test
```

### 4. Use Development Tools

```bash
# Install additional development tools
pip install pytest-watch  # Auto-run tests on file changes
pip install ipdb          # Better debugger
pip install ipython       # Enhanced REPL
```

## 📚 Additional Resources

- [Python Packaging Guide](https://packaging.python.org/)
- [pytest Documentation](https://docs.pytest.org/)
- [Black Code Formatter](https://black.readthedocs.io/)
- [MyPy Type Checker](https://mypy.readthedocs.io/)
- [Pre-commit Hooks](https://pre-commit.com/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Run all checks: `make check-all`
6. Commit your changes
7. Push and create a pull request

For more details, see [CONTRIBUTING.md](CONTRIBUTING.md).
