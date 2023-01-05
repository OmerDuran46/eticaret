

// ignore_for_file: unnecessary_question_mark, non_constant_identifier_names

class HomeModel {
  HomeModel({
    required this.success,
    required this.data,
    required this.summary,
  });

  final bool success;
  final Data? data;
  final Summary? summary;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
  );


}

class Data {
  Data({
    required this.appMainColor,
    required this.appSecondaryColor,
    required this.appSidebarBackgroundColor,
    required this.appSidebarTintColor,
    required this.appLicense,
    required this.list,
    required this.sliderIndex,
    required this.sliderDuration,
    required this.cartTotalCount,
    required this.forceUpdate,
  });

  final String appMainColor;
  final String appSecondaryColor;
  final String appSidebarBackgroundColor;
  final String appSidebarTintColor;
  final bool appLicense;
  final List<ListElement> list;
  final int sliderIndex;
  final int sliderDuration;
  final int cartTotalCount;
  final bool forceUpdate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    appMainColor: json["app_main_color"],
    appSecondaryColor: json["app_secondary_color"],
    appSidebarBackgroundColor: json["app_sidebar_background_color"],
    appSidebarTintColor: json["app_sidebar_tint_color "],
    appLicense: json["app_license"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    sliderIndex: json["slider_index"],
    sliderDuration: json["slider_duration"],
    cartTotalCount: json["cart_total_count"],
    forceUpdate: json["force_update"],
  );


}

class ListElement {
  ListElement({
    required this.name,
    required this.type,
    required this.column,
    required this.isHeaderVisible,
    required this.ratio,
    required this.options,

  });

  final String name;
  final String type;
  final int column;
  final bool isHeaderVisible;
  final int ratio;
  final List<Option> options;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    name: json["name"],
    type: json["type"],
    column: json["column"],
    isHeaderVisible: json["is_header_visible"],
    ratio: json["ratio"],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  );


}

class Option {
  Option({
    required this.name,
    required this.id,

    required this.image,
    required this.price_sell,
    required this.stock,
  });

  final String name;
  final String? id;
  final String image;

  final dynamic? stock;
  final dynamic price_sell;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    name: json["name"],

    price_sell: json["price_sell"],
    image: json["image"],
    stock: json["stock"],
    id: json["type_id"] ??"",
  );


}

class Summary {
  Summary({
    required this.totalRecordCount,
    required this.primaryKey,
  });

  final int totalRecordCount;
  final String primaryKey;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalRecordCount: json["totalRecordCount"],
    primaryKey: json["primaryKey"],
  );


}
