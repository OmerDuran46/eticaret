import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/add_favori_model.dart';


abstract class IAddFavoriInfoViewModel with ChangeNotifier{
  ApiResponse<AddFavoriModel> get addFavoriResponse;
  set addFavoriResponse(ApiResponse<AddFavoriModel> value);
  Future<void> addFavorite(urunId);
}