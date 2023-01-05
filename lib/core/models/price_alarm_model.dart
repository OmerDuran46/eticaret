
class PriceAlarmModel {
  PriceAlarmModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool success;
  final List<dynamic>? data;
  final List<Message>? message;
  final String summary;

  factory PriceAlarmModel.fromJson(Map<String, dynamic> json) => PriceAlarmModel(
    success: json["success"],
    data: json["data"] == null ? null : List<dynamic>.from(json["data"].map((x) => x)),
    message: json["message"] == null ? null : List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    summary: json["summary"],
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
  final List<String>? text;
  final List<dynamic>? errorField;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    type: json["type"],
    code: json["code"],
    index: json["index"],
    id: json["id"],
    subid: json["subid"],
    text: json["text"] == null ? null : List<String>.from(json["text"].map((x) => x)),
    errorField: json["errorField"] == null ? null : List<dynamic>.from(json["errorField"].map((x) => x)),
  );

}
