// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/get_product_comment_model.dart';
import 'package:eticaret/locator.dart';
import 'i_get_urun_aciklama_page_info_view_model.dart';


class getUrunAciklamaInfoViewModel with ChangeNotifier implements IGetUrunAciklamaInfoViewModel {
  ApiResponse<GetCommentModel> _urunAciklamaResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<GetCommentModel> get urunAciklamaResponse =>
      _urunAciklamaResponse;

  @override
  set urunAciklamaResponse(ApiResponse<GetCommentModel> value) {
    _urunAciklamaResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getComment(String urunId) async {
    try {
      final result = await locator<Api>().getComment(urunId: urunId);
      urunAciklamaResponse = ApiResponse.completed(result);
    } catch (e) {
      urunAciklamaResponse = ApiResponse.error(e.toString());
    }
  }


}


