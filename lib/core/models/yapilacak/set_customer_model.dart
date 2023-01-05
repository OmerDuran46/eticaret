class UpdateCustomerModel {
  UpdateCustomerModel({
    required this.success,
    required this.message,
    required this.summary,
  });

  final bool success;
  final List<Message>? message;
  final String summary;

  factory UpdateCustomerModel.fromJson(Map<String, dynamic> json) => UpdateCustomerModel(
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
    required this.text,
    required this.errorField,
  });

  final int type;
  final String code;
  final int index;

  final List<String>? text;
  final List<dynamic>? errorField;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    type: json["type"],
    code: json["code"],
    index: json["index"],
    text: List<String>.from(json["text"].map((x) => x)),
    errorField: List<dynamic>.from(json["errorField"].map((x) => x)),
  );
}
