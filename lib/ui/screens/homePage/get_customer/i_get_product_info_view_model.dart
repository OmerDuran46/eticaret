import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import '../../../../core/models/get_customer_model.dart';


abstract class IGetCustomerInfoViewModel with ChangeNotifier{
  ApiResponse<GetCustomerModel> get getcustomerResponse;
  set getcustomerResponse(ApiResponse<GetCustomerModel> value);
  Future<void> getCustomer();
}