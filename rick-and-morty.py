import requests
import csv

BASE_URL = "https://rickandmortyapi.com/api/character/"


def fetch_all_characters():
    characters = []

    # Fetch the first page to get total number of pages
    response = requests.get(BASE_URL)
    if response.status_code != 200:
        print("Failed to fetch data from API.")
        return []

    data = response.json()
    total_pages = data["info"]["pages"]
    characters.extend(data["results"])

    # Loop through remaining pages (page 2 to total_pages)
    for page in range(2, total_pages + 1):
        response = requests.get(f"{BASE_URL}?page={page}")
        if response.status_code == 200:
            data = response.json()
            characters.extend(data["results"])
        else:
            print(f"Failed to fetch page {page}")

    return characters


def save_to_csv():
    characters = fetch_all_characters()
    fields = [
        "id",
        "name",
        "status",
        "species",
        "type",
        "gender",
        "origin-name",
        "origin-url",
        "location",
        "image",
    ]

    with open(
        "rick_and_morty_characters.csv", "w", newline="", encoding="utf-8"
    ) as csvFile:
        writer = csv.writer(csvFile)
        writer.writerow(fields)
        for character in characters:
            writer.writerow(
                [
                    character["id"],
                    character["name"],
                    character["status"],
                    character["species"],
                    character["type"],
                    character["gender"],
                    character["origin"]["name"],
                    character["origin"]["url"],
                    character["location"]["name"],
                    character["image"],
                ]
            )


save_to_csv()
