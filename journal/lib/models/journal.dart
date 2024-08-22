class Journal {
  String id;
  String date;
  String mood;
  String note;
  String uid;
  Journal(
      {required this.id,
      required this.date,
      required this.mood,
      required this.note,
      required this.uid});
  factory Journal.fromDoc(dynamic doc) => Journal(
      id: doc.id,
      date: doc["date"],
      mood: doc["mood"],
      note: doc["note"],
      uid: doc["uid"]);

  Map<String, dynamic> toMap() => {
        'id': id,
        'date': date,
        'mood': mood,
        'note': note,
        'uid': uid,
      };
}
