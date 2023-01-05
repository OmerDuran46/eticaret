
// ignore_for_file: file_names

class ApplicationModel {
  ApplicationModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool success;
  final List<Datum> data;
  final List<Message> message;
  final String summary;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) => ApplicationModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    summary: json["summary"],
  );
  
}

class Datum {
  Datum({
    required this.userId,
    required this.username,
    required this.token,
    required this.secretKey,
    required this.expirationTime,
    required this.limited,
    required this.type,
    required this.tableId,
  });

  final String userId;
  final String username;
  final String token;
  final String secretKey;
  final String expirationTime;
  final String limited;
  final String type;
  final String tableId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userId: json["userId"],
    username: json["username"],
    token: json["token"],
    secretKey: json["secretKey"],
    expirationTime: json["expirationTime"],
    limited: json["limited"],
    type: json["type"],
    tableId: json["tableId"],
  );
  
}

class Message {
  Message({
    required this.type,
    required this.code,
    required this.index,
    required this.id,
    required this.subid,
    required this.text,
    required this.errorField,
  });

  final int type;
  final String code;
  final int index;
  final String id;
  final String subid;
  final List<String> text;
  final List<dynamic> errorField;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    type: json["type"],
    code: json["code"],
    index: json["index"],
    id: json["id"],
    subid: json["subid"],
    text: List<String>.from(json["text"].map((x) => x)),
    errorField: List<dynamic>.from(json["errorField"].map((x) => x)),
  );

 
}
