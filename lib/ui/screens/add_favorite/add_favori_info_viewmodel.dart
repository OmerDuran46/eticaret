// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/add_favori_model.dart';
import 'package:eticaret/locator.dart';

import 'i_add_favori_info_view_model.dart';

class addFavoriInfoViewModel with ChangeNotifier implements IAddFavoriInfoViewModel {
  ApiResponse<AddFavoriModel> _addFavoriResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<AddFavoriModel> get addFavoriResponse =>
      _addFavoriResponse;

  @override
  set addFavoriResponse(ApiResponse<AddFavoriModel> value) {
    _addFavoriResponse = value;
    notifyListeners();
  }

  @override
  Future<void> addFavorite(urunId) async {
    try {
      final result = await locator<Api>().addFavorite(urunId: urunId);
      addFavoriResponse = ApiResponse.completed(result);
    } catch (e) {
      addFavoriResponse = ApiResponse.error(e.toString());
    }
  }


}

