// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/locator.dart';

import '../../../../core/models/addToCart_model.dart';
import 'i_search_info_view_model.dart';

class getAddToCartInfoViewModel
    with ChangeNotifier
    implements IGetAddToCartInfoViewModel {
  ApiResponse<AddToCartModel> _addToCartResponse =
      ApiResponse.loading("loading");

  @override
  ApiResponse<AddToCartModel> get addToCartResponse => _addToCartResponse;

  @override
  set addToCartResponse(ApiResponse<AddToCartModel> value) {
    _addToCartResponse = value;
    notifyListeners();
  }

  @override
  Future<void> addToCard(productCount, productId, variantId) async {
    try {
      final result = await locator<Api>().addToCard(
          productCount: productCount,
          productId: productId,
          variantId: variantId);
      addToCartResponse = ApiResponse.completed(result);
    } catch (e) {
      addToCartResponse = ApiResponse.error(e.toString());
    }
  }
}
