import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';

import '../../../../../../core/models/yapilacak/delete_adress_model.dart';


abstract class IGetDeleteAddressInfoViewModel with ChangeNotifier{
  ApiResponse<DeleteAdressModel> get deleteAddressResponse;
  set deleteAddressResponse(ApiResponse<DeleteAdressModel> value);
  Future<void> deleteAddress(addressId);
}