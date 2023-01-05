import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';

import '../../../../../core/models/yapilacak/get_adress_model.dart';


abstract class IGetAddressInfoViewModel with ChangeNotifier{
  ApiResponse<GetAdressModel> get getAddressResponse;
  set getAddressResponse(ApiResponse<GetAdressModel> value);
  Future<void> getAddress();
}