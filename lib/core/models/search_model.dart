class SearchModel {
  SearchModel({
    required this.success,
    required this.data,
  });

  final bool success;
  final List<Datum>? data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        success: json["success"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.priceSell,
    required this.image,
  });

  final String id;
  final String title;
  late final dynamic priceSell;
  final Image? image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
    priceSell:json["price_sell"] is String?double.parse(json["price_sell"]):json["price_sell"],
      );
}

class Image {
  Image({
    required this.medium,
  });

  final String medium;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
      );
}
