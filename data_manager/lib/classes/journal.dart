class Journal {
  String id;
  String date;
  String mood;
  String note;

  Journal({
    this.id = "",
    this.date = "2024-01-01",
    this.mood = "",
    this.note = "",
  });

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        id: json["id"],
        date: json["date"],
        mood: json["mood"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "mood": mood,
        "note": note,
      };
}
