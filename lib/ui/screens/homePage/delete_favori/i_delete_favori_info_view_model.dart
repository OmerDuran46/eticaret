import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/delete_favori_model.dart';

abstract class IGetDeleteFavoriInfoViewModel with ChangeNotifier {
  ApiResponse<DeleteFavoriModel> get deleteFavoriResponse;

  set deleteFavoriResponse(ApiResponse<DeleteFavoriModel> value);

  Future<void> deleteFavori(id);
}
