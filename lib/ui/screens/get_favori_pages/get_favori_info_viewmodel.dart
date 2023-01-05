import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/favori_model.dart';
// ignore: unused_import
import 'package:eticaret/core/models/get_product_find_model.dart';
import 'package:eticaret/locator.dart';

import 'i_get_favori_info_view_model.dart';

// ignore: camel_case_types
class getFavoriInfoViewModel with ChangeNotifier implements IGetFavoriInfoViewModel {
  ApiResponse<FavoriModel> _favoriResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<FavoriModel> get favoriResponse =>
      _favoriResponse;

  @override
  set favoriResponse(ApiResponse<FavoriModel> value) {
    _favoriResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getFavori() async {
    try {
      final result = await locator<Api>().getFavori();
      favoriResponse = ApiResponse.completed(result);
    } catch (e) {
      favoriResponse = ApiResponse.error(e.toString());
    }
  }


}

