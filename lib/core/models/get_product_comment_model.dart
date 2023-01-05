

class GetCommentModel {
  GetCommentModel({
    required this.success,
    required this.data,
    required this.message,
    required this.summary,
  });

  final bool success;
  final List<Datum>? data;
  final List<Message>? message;
  final Summary? summary;

  factory GetCommentModel.fromJson(Map<String, dynamic> json) => GetCommentModel(
    success: json["success"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"] == null ? null : List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
  );


}

class Datum {
  Datum({
    required this.commentId,
    required this.productId,
    required this.customerId,
    required this.customerName,
    required this.productName,
    required this.dateTimeStamp,
    required this.comment,
    required this.title,
    required this.rate,
    required this.isNameDisplayed,
    required this.yesVote,
    required this.noVote,
    required this.status,
    required this.date,
  });

  final String commentId;
  final String productId;
  final String customerId;
  final String customerName;
  final String productName;
  final String dateTimeStamp;
  final String comment;
  final String title;
  final String rate;
  final String isNameDisplayed;
  final String yesVote;
  final String noVote;
  final String status;
  final String? date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    commentId: json["CommentId"],
    productId: json["ProductId"],
    customerId: json["CustomerId"],
    customerName: json["CustomerName"],
    productName: json["ProductName"],
    dateTimeStamp: json["DateTimeStamp"],
    comment: json["Comment"],
    title: json["Title"],
    rate: json["Rate"],
    isNameDisplayed: json["IsNameDisplayed"],
    yesVote: json["YesVote"],
    noVote: json["NoVote"],
    status: json["Status"],
    date: json["Date"],
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

class Summary {
  Summary({
    required this.totalRecordCount,
    required this.primaryKey,
  });

  final String totalRecordCount;
  final String primaryKey;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalRecordCount: json["totalRecordCount"],
    primaryKey: json["primaryKey"],
  );

}
