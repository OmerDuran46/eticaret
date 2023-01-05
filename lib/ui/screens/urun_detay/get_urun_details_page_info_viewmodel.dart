// ignore_for_file: unused_import, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/home_model.dart';
import 'package:eticaret/core/models/urun_details_model.dart';
import 'package:eticaret/locator.dart';
import 'i_get_urun_details_page_info_view_model.dart';


class getUrunDetailsInfoViewModel with ChangeNotifier implements IGetUrunDetailsInfoViewModel {
  ApiResponse<UrunDetailsModel> _urunDetailsResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<UrunDetailsModel> get urunDetailsResponse =>
      _urunDetailsResponse;

  @override
  set urunDetailsResponse(ApiResponse<UrunDetailsModel> value) {
    _urunDetailsResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getProductDetails(String urunId) async {
    try {
      final result = await locator<Api>().getProductDetails(urunId: urunId);
      urunDetailsResponse = ApiResponse.completed(result);
    } catch (e) {
      urunDetailsResponse = ApiResponse.error(e.toString());
    }
  }
}


