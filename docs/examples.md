# Usage Examples

This document provides practical examples of how to use the CLI Dev Toolbox.

## JSON to CSV Conversion

### Basic Conversion

Convert a simple JSON file to CSV:

```bash
# Input JSON file (data.json)
[
  {"name": "Alice", "age": 30, "city": "New York"},
  {"name": "Bob", "age": 25, "city": "Los Angeles"},
  {"name": "Charlie", "age": 35, "city": "Chicago"}
]

# Convert to CSV
cli-dev-toolbox json2csv data.json output.csv
```

### Complex JSON Structure

Handle nested JSON structures:

```bash
# Input JSON file (employees.json)
{
  "emp_details": [
    {
      "id": 1,
      "name": "Alice Johnson",
      "department": "Engineering",
      "salary": 75000,
      "skills": ["Python", "JavaScript", "SQL"]
    },
    {
      "id": 2,
      "name": "Bob Smith",
      "department": "Marketing",
      "salary": 65000,
      "skills": ["SEO", "Content Writing", "Analytics"]
    }
  ]
}

# Convert to CSV
cli-dev-toolbox json2csv employees.json employees.csv
```

### Large Dataset Conversion

Convert large JSON datasets:

```bash
# Convert a large dataset
cli-dev-toolbox json2csv large_dataset.json large_dataset.csv

# Check the output
wc -l large_dataset.csv
head -5 large_dataset.csv
```

## Pretty JSON Printing (Coming Soon)

### Format JSON Files

```bash
# Format a JSON file for better readability
cli-dev-toolbox prettyjson config.json

# Format and save to a new file
cli-dev-toolbox prettyjson input.json > formatted.json
```

### Examples of Pretty Printing

**Before formatting:**
```json
{"name":"Alice","age":30,"city":"New York","hobbies":["reading","swimming","coding"]}
```

**After formatting:**
```json
{
  "name": "Alice",
  "age": 30,
  "city": "New York",
  "hobbies": [
    "reading",
    "swimming",
    "coding"
  ]
}
```

## URL Fetching (Coming Soon)

### Basic URL Fetching

```bash
# Fetch a simple URL
cli-dev-toolbox fetch https://httpbin.org/get

# Fetch with response time measurement
cli-dev-toolbox fetch https://api.github.com/users/octocat
```

### Batch URL Fetching

```bash
# Fetch multiple URLs from a file
echo "https://httpbin.org/get" > urls.txt
echo "https://httpbin.org/post" >> urls.txt
echo "https://httpbin.org/put" >> urls.txt

# Fetch all URLs
while read url; do
  cli-dev-toolbox fetch "$url"
done < urls.txt
```

## Python API Examples

### Using the Converters Module

```python
from cli_dev_toolbox.converters import json_to_csv

# Convert JSON to CSV
json_to_csv("data.json", "output.csv")

# Handle errors
try:
    json_to_csv("nonexistent.json", "output.csv")
except FileNotFoundError:
    print("Input file not found!")
except json.JSONDecodeError:
    print("Invalid JSON format!")
```

### Using the Fetcher Module (Coming Soon)

```python
from cli_dev_toolbox.fetcher import fetch_url

# Fetch a URL
response = fetch_url("https://httpbin.org/get")
print(f"Status: {response['status_code']}")
print(f"Response time: {response['response_time']}ms")
print(f"Content length: {len(response['content'])} bytes")
```

## Real-World Use Cases

### Data Analysis Workflow

```bash
# 1. Download JSON data from API
curl -o data.json https://api.example.com/data

# 2. Convert to CSV for analysis
cli-dev-toolbox json2csv data.json analysis_data.csv

# 3. Import into spreadsheet or analysis tool
# (Excel, Google Sheets, pandas, etc.)
```

### Configuration Management

```bash
# 1. Format configuration files
cli-dev-toolbox prettyjson config.json > formatted_config.json

# 2. Validate JSON structure
python -m json.tool formatted_config.json

# 3. Use in application
cp formatted_config.json /etc/app/config.json
```

### API Testing

```bash
# 1. Test API endpoints
cli-dev-toolbox fetch https://api.example.com/health

# 2. Measure response times
cli-dev-toolbox fetch https://api.example.com/users

# 3. Monitor performance
for i in {1..10}; do
  cli-dev-toolbox fetch https://api.example.com/data
  sleep 1
done
```

## Error Handling Examples

### File Not Found

```bash
# Try to convert non-existent file
cli-dev-toolbox json2csv nonexistent.json output.csv
# Error: File 'nonexistent.json' not found
```

### Invalid JSON

```bash
# Try to convert malformed JSON
echo '{"name": "Alice", "age": 30,}' > invalid.json
cli-dev-toolbox json2csv invalid.json output.csv
# Error: Invalid JSON format in 'invalid.json'
```

### Permission Errors

```bash
# Try to write to protected directory
cli-dev-toolbox json2csv data.json /root/output.csv
# Error: Permission denied writing to '/root/output.csv'
```

## Integration Examples

### Shell Scripts

```bash
#!/bin/bash
# Convert all JSON files in a directory

for json_file in *.json; do
    if [ -f "$json_file" ]; then
        csv_file="${json_file%.json}.csv"
        echo "Converting $json_file to $csv_file"
        cli-dev-toolbox json2csv "$json_file" "$csv_file"
    fi
done
```

### Makefile Integration

```makefile
# Makefile example
.PHONY: convert-data clean

convert-data:
	cli-dev-toolbox json2csv data.json output.csv

clean:
	rm -f *.csv
```

### Python Scripts

```python
import subprocess
import sys

def convert_json_files(json_files):
    """Convert multiple JSON files to CSV."""
    for json_file in json_files:
        csv_file = json_file.replace('.json', '.csv')
        try:
            subprocess.run([
                'cli-dev-toolbox', 'json2csv',
                json_file, csv_file
            ], check=True)
            print(f"Converted {json_file} to {csv_file}")
        except subprocess.CalledProcessError as e:
            print(f"Error converting {json_file}: {e}")

if __name__ == "__main__":
    convert_json_files(sys.argv[1:])
```
