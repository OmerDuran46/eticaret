import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/urun_details_model.dart';


abstract class IGetUrunDetailsInfoViewModel with ChangeNotifier{
  ApiResponse<UrunDetailsModel> get urunDetailsResponse;
  set urunDetailsResponse(ApiResponse<UrunDetailsModel> value);
  Future<void> getProductDetails(String urunId);
}