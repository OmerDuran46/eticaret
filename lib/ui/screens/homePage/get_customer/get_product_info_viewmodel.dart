// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/get_customer_model.dart';
import 'package:eticaret/locator.dart';

import 'i_get_product_info_view_model.dart';


class getCustomerInfoViewModel with ChangeNotifier implements IGetCustomerInfoViewModel {
  ApiResponse<GetCustomerModel> _getCustomerTreeResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<GetCustomerModel> get getcustomerResponse =>
      _getCustomerTreeResponse;

  @override
  set getcustomerResponse(ApiResponse<GetCustomerModel> value) {
    _getCustomerTreeResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getCustomer() async {
    try {
      final result = await locator<Api>().getCustomer();
      getcustomerResponse = ApiResponse.completed(result);
    } catch (e) {
      getcustomerResponse = ApiResponse.error(e.toString());
    }
  }

}

