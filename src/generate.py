import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["id", "country", "manufacturer", "item"]

def generate_row():

    return {
        "id": random.randint(1, 1000),
        "country": random.choice(["Russia", "USA", "Italy", "Germany"]),
        "manufacturer": random.choice(["Company A", "Company B", "Company C", "Company D"]),
        "item": random.choice(["Car", "T-shirt", "Keyboard"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)
