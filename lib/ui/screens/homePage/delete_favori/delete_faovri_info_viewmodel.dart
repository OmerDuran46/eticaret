// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/delete_favori_model.dart';
import 'package:eticaret/locator.dart';
import 'i_delete_favori_info_view_model.dart';

class getDeleteFavoriInfoViewModel with ChangeNotifier implements IGetDeleteFavoriInfoViewModel {
  ApiResponse<DeleteFavoriModel> _deleteFavoriResponse = ApiResponse.loading("loading");

  @override
  ApiResponse<DeleteFavoriModel> get deleteFavoriResponse => _deleteFavoriResponse;

  @override
  set deleteFavoriResponse(ApiResponse<DeleteFavoriModel> value) {
    _deleteFavoriResponse = value;
    notifyListeners();
  }

  @override
  Future<void> deleteFavori(id) async {
    try {
      final result = await locator<Api>().deleteFavori(id: id);
      deleteFavoriResponse = ApiResponse.completed(result);
    } catch (e) {
      deleteFavoriResponse = ApiResponse.error(e.toString());
    }
  }
}
