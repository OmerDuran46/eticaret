// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/product_list_model.dart';
import 'package:eticaret/locator.dart';
import 'i_product_list_info_view_model.dart';


class getProductListInfoViewModel with ChangeNotifier implements IGetProductListInfoViewModel {
  ApiResponse<ProductListModel> _productListResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<ProductListModel> get productListResponse =>
      _productListResponse;

  @override
  set productListResponse(ApiResponse<ProductListModel> value) {
    _productListResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getProductFindCategori(dynamic categoriId) async {
    try {
      final result = await locator<Api>().getProductFindCategori(categoriId: categoriId);
      productListResponse = ApiResponse.completed(result);
    } catch (e) {
      productListResponse = ApiResponse.error(e.toString());
    }
  }

}

