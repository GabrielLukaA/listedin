import 'dart:typed_data';

class File {
  int? id;
  String name;
  String type;
  Uint8List data;

  File(this.name, this.type, this.data, {this.id});
  factory File.fromJson(Map<String, dynamic> map) {
    return File(id: map["id"], map["name"], map["type"], map["data"]);
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["type"] = type;
    data["data"] = this.data;
    return data;
  }
}
