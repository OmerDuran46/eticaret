import 'package:eticaret/core/models/create_customer_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/api/api_response.dart';

abstract class ICreateCustomerInfoViewModel with ChangeNotifier{
  ApiResponse<CreateCustomerModel> get createCustomerResponse;
  set createCustomerResponse(ApiResponse<CreateCustomerModel> value);
  Future<void> createCustomer(name, surname, email, password, phone, isEmailNotificationOn, isSmsNotificationOn,isPhoneCallNotificationOn);
}