import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/get_cart_model.dart';

import '../../../../core/models/delete_cart_item_model.dart';


abstract class IGetCartInfoViewModel with ChangeNotifier{
  ApiResponse<GetCartModel> get getCartResponse;
  set getCartResponse(ApiResponse<GetCartModel> value);
  Future<void> getCart(customerId);
}
abstract class IDeleteCartItemInfoViewModel with ChangeNotifier{
  ApiResponse<DeleteCartItemModel> get deleteCartItemResponse;
  set deleteCartItemResponse(ApiResponse<DeleteCartItemModel> value);
  Future<void> deleteCartItem(productId,variantId);
}