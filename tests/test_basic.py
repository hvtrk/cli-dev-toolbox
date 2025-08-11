from converters import json_to_csv
import json
import os

def test_json_to_csv(tmp_path):
    data = [{"name": "Alice"}, {"name": "Bob"}]
    json_path = tmp_path / "data.json"
    csv_path = tmp_path / "data.csv"

    with open(json_path, "w") as f:
        json.dump(data, f)

    json_to_csv(str(json_path), str(csv_path))
    assert os.path.exists(csv_path)
