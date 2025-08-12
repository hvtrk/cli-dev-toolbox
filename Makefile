.PHONY: help install install-dev test test-cov lint format type-check clean build dist publish test-publish

# Default target
help:
	@echo "Available commands:"
	@echo "  install      - Install the package in development mode"
	@echo "  install-dev  - Install development dependencies"
	@echo "  test         - Run tests"
	@echo "  test-cov     - Run tests with coverage"
	@echo "  lint         - Run linting checks"
	@echo "  format       - Format code with black and isort"
	@echo "  type-check   - Run type checking with mypy"
	@echo "  clean        - Clean build artifacts"
	@echo "  build        - Build package"
	@echo "  dist         - Create distribution files"
	@echo "  publish      - Publish to PyPI"
	@echo "  test-publish - Publish to TestPyPI"

# Installation
install:
	pip install -e .

install-dev:
	pip install -e ".[dev]"
	pre-commit install

# Testing
test:
	pytest

test-cov:
	pytest --cov=cli_dev_toolbox --cov-report=html --cov-report=term-missing

# Code quality
lint:
	flake8 cli_dev_toolbox/ tests/ --max-line-length=88
	black --check .
	isort --check-only .

format:
	black .
	isort .

type-check:
	mypy cli_dev_toolbox/

# Build and distribution
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	rm -rf htmlcov/
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete

build:
	python -m build

dist: clean build

# Publishing
publish: dist
	twine upload dist/*

test-publish: dist
	twine upload --repository testpypi dist/*

# Development workflow
dev-setup: install-dev
	@echo "Development environment setup complete!"

check-all: lint type-check test
	@echo "All checks passed!"

# Quick development commands
quick-test:
	pytest -x

quick-lint:
	flake8 cli_dev_toolbox/

quick-format:
	black cli_dev_toolbox/
	isort cli_dev_toolbox/
