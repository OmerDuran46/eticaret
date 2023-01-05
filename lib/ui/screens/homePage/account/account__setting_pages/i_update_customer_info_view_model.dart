import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/models/yapilacak/set_customer_model.dart';

import '../../../../../core/api/api_response.dart';

abstract class IGetUpdateCustomerInfoViewModel with ChangeNotifier{
  ApiResponse<UpdateCustomerModel> get updateCustomerResponse;
  set updateCustomerResponse(ApiResponse<UpdateCustomerModel> value);
  Future<void> updateCustomer(name, surname, email, phone, mobile, address, postcode);
}