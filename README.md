# 📦 CLI Dev Toolbox

![Python Version](https://img.shields.io/badge/python-3.10%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Build Status](https://github.com/hvtrk/cli-dev-toolbox/actions/workflows/ci.yml/badge.svg)


A Python command-line utility for developers — includes JSON ↔ CSV conversion, JSON pretty-printing, and HTTP URL response time checking.

---

## **📖 Table of Contents**

* [About](#about)
* [Features](#features)
* [Tech Stack](#tech-stack)
* [Installation](#installation)
* [Usage](#usage)
* [Examples](#examples)
* [Project Structure](#project-structure)
* [Future Enhancements](#future-enhancements)

---

## **📜 About**

* CLI building with `argparse`
* Modular project structure
* File handling (JSON, CSV)
* HTTP requests with `requests`

---

## **✨ Features**

✅ Convert JSON → CSV
✅ Pretty-print JSON files
✅ Fetch URL and measure response time
✅ Modular & easy to extend

---

## **🛠 Tech Stack**

* Python 3.10+
* [`argparse`](https://docs.python.org/3/library/argparse.html) — CLI parser
* [`requests`](https://pypi.org/project/requests/) — HTTP requests

---

## **⚙ Installation**

```bash
# Clone the repository
git clone https://github.com/<your-username>/cli-dev-toolbox.git
cd cli-dev-toolbox

# Create a virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

---

## **🚀 Usage**

```bash
python toolbox.py <command> [options]
```

---

## **📌 Commands**

| Command      | Description                      | Example Usage                                      |
| ------------ | -------------------------------- | -------------------------------------------------- |
| `json2csv`   | Convert JSON file to CSV         | `python toolbox.py json2csv input.json output.csv` |
| `prettyjson` | Pretty-print JSON file           | `python toolbox.py prettyjson input.json`          |
| `fetch`      | Fetch URL and show response time | `python toolbox.py fetch https://example.com`      |

---

## **💡 Examples**

**Convert JSON to CSV**

```bash
python toolbox.py json2csv data.json data.csv
```

**Pretty-print JSON**

```bash
python toolbox.py prettyjson data.json
```

**Fetch URL**

```bash
python toolbox.py fetch https://openai.com
```

---

## **📂 Project Structure**

```
cli-dev-toolbox/
│── toolbox.py         # CLI entry point
│── converters.py      # JSON <-> CSV utilities
│── fetcher.py         # HTTP fetch utilities
│── requirements.txt   # Dependencies
│── README.md          # Documentation
```

---

## **🔮 Future Enhancements**

* CSV → JSON conversion
* Bulk URL fetch from a file
* Color-coded CLI output
* Add `typer` for modern CLI UX

---
