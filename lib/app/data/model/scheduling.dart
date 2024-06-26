class Scheduling {
  int? id;
  DateTime date;

  Scheduling(this.date, {this.id});

  factory Scheduling.fromJSON(Map<String, dynamic> map) {
    return Scheduling( DateTime.parse(map['date']), id: map['id'],);
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date.toString();
    return data;
  }
}
