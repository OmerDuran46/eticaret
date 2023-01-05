import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/get_product_find_model.dart';


abstract class IGetProductInfoViewModel with ChangeNotifier{
  ApiResponse<ProductFindModel> get productFindResponse;
  set productFindResponse(ApiResponse<ProductFindModel> value);
  Future<void> getProductList(urunId);
}