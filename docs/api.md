# API Documentation

## CLI Commands

### json2csv

Convert JSON files to CSV format.

```bash
cli-dev-toolbox json2csv <input_file> <output_file>
```

**Parameters:**
- `input_file`: Path to the input JSON file
- `output_file`: Path to the output CSV file

**Example:**
```bash
cli-dev-toolbox json2csv data.json output.csv
```

### prettyjson

Format JSON files with proper indentation (coming soon).

```bash
cli-dev-toolbox prettyjson <input_file>
```

**Parameters:**
- `input_file`: Path to the input JSON file

### fetch

Fetch URLs and measure response times (coming soon).

```bash
cli-dev-toolbox fetch <url>
```

**Parameters:**
- `url`: The URL to fetch

## Python API

### converters module

#### json_to_csv(input_file, output_file)

Convert a JSON file to CSV format.

**Parameters:**
- `input_file` (str): Path to the input JSON file
- `output_file` (str): Path to the output CSV file

**Raises:**
- `FileNotFoundError`: If the input file doesn't exist
- `JSONDecodeError`: If the JSON file is malformed
- `IOError`: If there's an error writing the CSV file

**Example:**
```python
from cli_dev_toolbox.converters import json_to_csv

json_to_csv("data.json", "output.csv")
```

### fetcher module

#### fetch_url(url)

Fetch a URL and return response information (coming soon).

**Parameters:**
- `url` (str): The URL to fetch

**Returns:**
- `dict`: Response information including status code, response time, and content

## Error Handling

The CLI tool provides clear error messages for common issues:

- File not found errors
- JSON parsing errors
- Network connection errors
- Permission errors

## Exit Codes

- `0`: Success
- `1`: General error
- `2`: Invalid arguments
- `3`: File operation error
- `4`: Network error
