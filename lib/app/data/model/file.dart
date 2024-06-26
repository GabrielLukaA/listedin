import 'dart:convert';
import 'dart:typed_data';

class File {
  int? id;
  String name;
  String type;
  Uint8List data;

  File(this.name, this.type, this.data, {this.id});
  factory File.fromJSON(Map<String, dynamic> map) {
    return File(
        map["name"], map["type"], dataStringToByte(map["data"]), id: map["id"],);
  }

  static dataStringToByte(String data) {
    List<int> list = utf8.encode(data);
    Uint8List bytes = Uint8List.fromList(list);
    return bytes;
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["type"] = type;
    data["data"] = utf8.decode(this.data);
    return data;
  }
}
