class Todo {
  int? id;
  String name;
  String content;
  DateTime time;
  bool status;
  Todo(
      {this.id,
      required this.name,
      required this.content,
      required this.time,
      required this.status});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'] as int,
        name: json['name'] as String,
        content: json['content'] as String,
        time: DateTime.parse(json['time'] as String),
        status: json['status'] as bool);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'content': content,
      'time': time.toIso8601String(),
      'status': status,
    };

    if (id != null) {
      data['id'] = id;
    }

    return data;
  }

  Todo copyWith({
    int? id,
    String? name,
    String? content,
    DateTime? time,
    bool? status,
  }) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }
}
