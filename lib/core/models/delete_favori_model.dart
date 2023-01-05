class DeleteFavoriModel {
  DeleteFavoriModel({
    required this.success,
  });

  final bool success;


  factory DeleteFavoriModel.fromJson(Map<String, dynamic> json) =>
      DeleteFavoriModel(
        success: json["success"],
      );
}
