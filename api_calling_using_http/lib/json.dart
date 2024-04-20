Map<String, dynamic> data = {
  "Title": "My TAks",
  "description": "wertyhhgfdghjk",
  "isCoplted": false,
  "date": "20-03-2024"
};

List<Map<String, dynamic>> data2 = [
  {
    "Title": "My Tak-1",
    "description": "description-1",
    "isCoplted": false,
    "date": "20-03-2024"
  },
  {
    "Title": "My Task-2",
    "description": "description-2",
    "isCoplted": false,
    "date": "23-03-2024"
  },
  {
    "Title": "My Task-3",
    "description": "description-3",
    "isCoplted": false,
    "date": "24-03-2024"
  }
];

void main(List<String> args) {
  print(data2[1]["date"]);
}
