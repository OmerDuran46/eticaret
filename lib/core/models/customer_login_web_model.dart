
class CustomerLoginWebModel {
  CustomerLoginWebModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool? success;
  final List<Datum?>? data;
  final List<Message?>? message;
  final String? summary;

  factory CustomerLoginWebModel.fromJson(Map<String, dynamic> json) => CustomerLoginWebModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"] == null ? [] : List<Message?>.from(json["message"]!.map((x) => Message.fromJson(x))),
    summary: json["summary"],
  );

}

class Datum {
  Datum({
    required this.loginRedirectUrl,
    required this.tokenExpirationTime,
    required this.mobileRedirectVersion,
  });

  final String? loginRedirectUrl;
  final DateTime? tokenExpirationTime;
  final int? mobileRedirectVersion;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    loginRedirectUrl: json["loginRedirectUrl"],
    tokenExpirationTime: DateTime.parse(json["tokenExpirationTime"]),
    mobileRedirectVersion: json["mobileRedirectVersion"],
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

  final int? type;
  final String? code;
  final int? index;
  final int? id;
  final String? subid;
  final List<String?>? text;
  final List<dynamic>? errorField;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    type: json["type"],
    code: json["code"],
    index: json["index"],
    id: json["id"],
    subid: json["subid"],
    text: json["text"] == null ? [] : List<String?>.from(json["text"]!.map((x) => x)),
    errorField: json["errorField"] == null ? [] : List<dynamic>.from(json["errorField"]!.map((x) => x)),
  );


}
