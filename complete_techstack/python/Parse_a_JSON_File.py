#Question: Write a Python script to parse a JSON file containing server metrics and print the server names with CPU usage above 80%.
import json

def parse_json(file_path):
    with open(file_path, "r") as file:
        data = json.load(file)
    for server in data["servers"]:
        if server["cpu_usage"] > 80:
            print(f"High CPU usage on server: {server['name']} ({server['cpu_usage']}%)")

# Example JSON file structure:
# {
#     "servers": [
#         {"name": "server1", "cpu_usage": 75},
#         {"name": "server2", "cpu_usage": 85}
#     ]
# }

parse_json("metrics.json")
#Key Concepts: JSON handling, file I/O.
