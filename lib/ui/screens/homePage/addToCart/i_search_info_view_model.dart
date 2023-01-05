
import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/addToCart_model.dart';

abstract class IGetAddToCartInfoViewModel with ChangeNotifier {
  ApiResponse<AddToCartModel> get addToCartResponse;

  set addToCartResponse(ApiResponse<AddToCartModel> value);

  Future<void> addToCard(
      dynamic productCount,
    dynamic productId,

    dynamic variantId,
  );
}
