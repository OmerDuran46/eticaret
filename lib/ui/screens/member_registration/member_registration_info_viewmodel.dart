// ignore_for_file: camel_case_types

import 'package:eticaret/core/models/create_customer_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/locator.dart';

import 'i_member_registration_info_view_model.dart';


class createCustomerInfoViewModel with ChangeNotifier implements ICreateCustomerInfoViewModel {
  ApiResponse<CreateCustomerModel> _createCustomerResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<CreateCustomerModel> get createCustomerResponse =>
      _createCustomerResponse;

  @override
  set createCustomerResponse(ApiResponse<CreateCustomerModel> value) {
    _createCustomerResponse = value;
    notifyListeners();
  }

  @override
  Future<void> createCustomer(name, surname, email, password, phone, isEmailNotificationOn,isSmsNotificationOn, isPhoneCallNotificationOn) async {
    try {
      final result = await locator<Api>().createCustomer(name, surname, email, password, phone, isEmailNotificationOn,isSmsNotificationOn, isPhoneCallNotificationOn);
      createCustomerResponse = ApiResponse.completed(result);
    } catch (e) {
      createCustomerResponse = ApiResponse.error(e.toString());
    }
  }
}
