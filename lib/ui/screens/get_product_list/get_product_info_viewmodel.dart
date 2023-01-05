// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/get_product_find_model.dart';
import 'package:eticaret/locator.dart';

import 'i_get_product_info_view_model.dart';

class getProductInfoViewModel with ChangeNotifier implements IGetProductInfoViewModel {
  ApiResponse<ProductFindModel> _productResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<ProductFindModel> get productFindResponse =>
      _productResponse;

  @override
  set productFindResponse(ApiResponse<ProductFindModel> value) {
    _productResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getProductList( urunId) async {
    try {
      final result = await locator<Api>().getProduct(urunId: urunId);
      productFindResponse = ApiResponse.completed(result);
    } catch (e) {
      productFindResponse = ApiResponse.error(e.toString());
    }
  }

}

