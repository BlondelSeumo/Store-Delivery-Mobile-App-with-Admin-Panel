class Notification {
  String id;
  String type;
  Map<String, dynamic> data;
  bool read;
  DateTime createdAt;

  Notification();

  Notification.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      type = jsonMap['type'] != null ? jsonMap['type'].toString() : '';
      data = jsonMap['data'] != null ? {} : {};
      read = jsonMap['read_at'] != null ? true : false;
      createdAt = DateTime.parse(jsonMap['created_at']);
    } catch (e) {
      id = '';
      type = '';
      data = {};
      read = false;
      createdAt = new DateTime(0);
      print(e);
    }
  }
}
