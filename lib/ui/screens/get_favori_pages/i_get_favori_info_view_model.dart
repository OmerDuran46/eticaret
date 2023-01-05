

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/favori_model.dart';


abstract class IGetFavoriInfoViewModel with ChangeNotifier{
  ApiResponse<FavoriModel> get favoriResponse;
  set favoriResponse(ApiResponse<FavoriModel> value);
  Future<void> getFavori();
}