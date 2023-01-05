import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/search_model.dart';


abstract class IGetSearchInfoViewModel with ChangeNotifier{
  ApiResponse<SearchModel> get searchResponse;
  set searchResponse(ApiResponse<SearchModel> value);
  Future<void> getProductFind(dynamic q);
}