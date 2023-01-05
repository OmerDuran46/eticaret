// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/get_cart_model.dart';
import 'package:eticaret/locator.dart';

import '../../../../core/models/delete_cart_item_model.dart';
import 'i_get_cart_info_view_model.dart';


class getCartInfoViewModel with ChangeNotifier implements IGetCartInfoViewModel {
  ApiResponse<GetCartModel> _getCartResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<GetCartModel> get getCartResponse =>
      _getCartResponse;

  @override
  set getCartResponse(ApiResponse<GetCartModel> value) {
    _getCartResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getCart(customerId,yeniToken) async {
    try {
      final result = await locator<Api>().getCart(customerId,yeniToken);
      getCartResponse = ApiResponse.completed(result);
    } catch (e) {
      getCartResponse = ApiResponse.error(e.toString());
    }
  }

}

class deleteCartItemInfoViewModel with ChangeNotifier implements IDeleteCartItemInfoViewModel {
  ApiResponse<DeleteCartItemModel> _deleteCartItemResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<DeleteCartItemModel> get deleteCartItemResponse =>
      _deleteCartItemResponse;

  @override
  set deleteCartItemResponse(ApiResponse<DeleteCartItemModel> value) {
    _deleteCartItemResponse = value;
    notifyListeners();
  }

  @override
  Future<void> deleteCartItem(productId,variantId) async {
    try {
      final result = await locator<Api>().deleteCartItem(productId,variantId);
      deleteCartItemResponse = ApiResponse.completed(result);
    } catch (e) {
      deleteCartItemResponse = ApiResponse.error(e.toString());
    }
  }

}

