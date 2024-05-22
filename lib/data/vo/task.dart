class Task {
  int? id;
  int? isComplete;
  String? title;
  String? note;
  String? date;
  String? time;
  String? repeat;

  Task({
    this.id,
    this.isComplete,
    this.title,
    this.note,
    this.date,
    this.time,
    this.repeat,
  });

  // Deserialize JSON to Task object
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        isComplete: json['isComplete'],
        title: json['title'],
        note: json['note'],
        date: json['date'],
        time: json['time'],
        repeat: json['repeat'],
      );

  // Serialize Task object to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'isComplete': isComplete,
        'title': title,
        'note': note,
        'date': date,
        'time': time,
        'repeat': repeat,
      };
}
