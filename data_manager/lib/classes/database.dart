import 'journal.dart';

class Database {
  List<Journal> journals;
  Database({
    required this.journals,
  });
  factory Database.fromJson(Map<String, dynamic> json) => Database(
        journals: List<Journal>.from(
            json["journals"].map((x) => Journal.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "journals": List<dynamic>.from(journals.map((x) => x.toJson())),
      };
}
