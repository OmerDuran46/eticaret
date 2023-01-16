import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';

import '../../../../core/models/product_list_model.dart';


abstract class IGetProductListInfoViewModel with ChangeNotifier{
  ApiResponse<ProductListModel> get productListResponse;
  set productListResponse(ApiResponse<ProductListModel> value);
  Future<void> getProductFindCategori(dynamic categoriId,dynamic short);
}