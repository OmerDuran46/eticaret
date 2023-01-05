// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/models/yapilacak/set_customer_model.dart';

import '../../../../../core/api/api.dart';
import '../../../../../core/api/api_response.dart';
import '../../../../../locator.dart';
import 'i_update_customer_info_view_model.dart';

class getUpdateCustomerInfoViewModel with ChangeNotifier implements IGetUpdateCustomerInfoViewModel {
  ApiResponse<UpdateCustomerModel> _updateCustomerResponse = ApiResponse.loading("loading");

  @override
  ApiResponse<UpdateCustomerModel> get updateCustomerResponse => _updateCustomerResponse;

  @override
  set updateCustomerResponse(ApiResponse<UpdateCustomerModel> value) {
    _updateCustomerResponse = value;
    notifyListeners();
  }

  @override
  Future<void> updateCustomer(name, surname, email, phone, mobile, address, postcode) async {
    try {
      final result = await locator<Api>().updateCustomer(name, surname, email, phone, mobile, address, postcode);
      updateCustomerResponse = ApiResponse.completed(result);
    } catch (e) {
      updateCustomerResponse = ApiResponse.error(e.toString());
    }
  }
}
