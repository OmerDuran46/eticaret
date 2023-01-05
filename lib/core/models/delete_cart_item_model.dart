

class DeleteCartItemModel {
  DeleteCartItemModel({
    required this.success,

    required this.message,
    required this.summary,
  });

  final bool success;

  final List<Message> message;
  final String summary;

  factory DeleteCartItemModel.fromJson(Map<String, dynamic> json) => DeleteCartItemModel(
    success: json["success"],

    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
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
