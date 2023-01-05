class CategoriTreeModel {
  CategoriTreeModel({
    required this.success,
    required this.data,
    required this.message,

  });

  final bool? success;
  final List<Datum>? data;
  final List<Message>? message;

  factory CategoriTreeModel.fromJson(Map<String, dynamic> json) => CategoriTreeModel(
    success: json["success"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"] == null ? null : List<Message>.from(json["message"].map((x) => Message.fromJson(x))),

  );


}

class Datum {
  Datum({
    required this.id,
    required this.categoryId,
    required this.text,
    required this.isActive,
    required this.cls,
    required this.leaf,
    required this.checked,
    // required this.children,
  });

  final String id;
  final String categoryId;
  final String text;
  final String isActive;
  final String cls;
  final dynamic leaf;
  final dynamic checked;
  // final List<DatumChild>? children;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryId: json["category_id"],
    text: json["text"],
    // ignore: prefer_if_null_operators
    isActive: json["is_active"] == null ? null : json["is_active"],
    cls: json["cls"],
    leaf: json["leaf"],
    checked: json["checked"],
    // children: json["children"] == null ? null : List<DatumChild>.from(json["children"].map((x) => DatumChild.fromJson(x))),
  );


}

// class DatumChild {
//   DatumChild({
//     required this.id,
//     required this.categoryId,
//     required this.text,
//     required this.isActive,
//     required this.cls,
//     required this.leaf,
//     required this.checked,
//     required this.children,
//   });
//
//   final String id;
//   final String categoryId;
//   final String text;
//   final String isActive;
//   final String cls;
//   final dynamic leaf;
//   final dynamic checked;
//   final List<ChildChild>? children;
//
//   factory DatumChild.fromJson(Map<String, dynamic> json) => DatumChild(
//     id: json["id"] == null ? null : json["id"],
//     categoryId: json["category_id"] == null ? null : json["category_id"],
//     text: json["text"] == null ? null : json["text"],
//     isActive: json["is_active"] == null ? null : json["is_active"],
//     cls: json["cls"] == null ? null : json["cls"],
//     leaf: json["leaf"] == null ? null : json["leaf"],
//     checked: json["checked"] == null ? null : json["checked"],
//     children: json["children"] == null ? null : List<ChildChild>.from(json["children"].map((x) => ChildChild.fromJson(x))),
//   );
//
//
// }

class ChildChild {
  ChildChild({
    required this.id,
    required this.categoryId,
    required this.text,
    required this.isActive,
    required this.cls,
    required this.leaf,
    required this.checked,
  });

  final String id;
  final String categoryId;
  final String text;
  final String isActive;
  final String cls;
  final dynamic leaf;
  final dynamic checked;

  factory ChildChild.fromJson(Map<String, dynamic> json) => ChildChild(
    id: json["id"],
    categoryId: json["category_id"],
    text: json["text"],
    isActive: json["is_active"],
    cls: json["cls"],
    leaf: json["leaf"],
    checked: json["checked"],
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

  final dynamic type;
  final dynamic code;
  final int index;
  final String id;
  final String subid;
  final List<dynamic>? text;
  final List<dynamic>? errorField;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    type: json["type"],
    code: json["code"],
    index: json["index"],
    id: json["id"],
    subid: json["subid"],
    text: json["text"] == null ? null : List<dynamic>.from(json["text"].map((x) => x)),
    errorField: json["errorField"] == null ? null : List<dynamic>.from(json["errorField"].map((x) => x)),
  );
}

class Summary {
  Summary({
    required this.totalRecordCount,
    required this.primaryKey,
  });

  final dynamic totalRecordCount;
  final dynamic primaryKey;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalRecordCount: json["totalRecordCount"],
    primaryKey: json["primaryKey"],
  );

  Map<String, dynamic> toJson() => {
    "totalRecordCount": totalRecordCount,
    "primaryKey": primaryKey,
  };
}
