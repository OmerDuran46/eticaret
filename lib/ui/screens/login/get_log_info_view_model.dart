



import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/locator.dart';

import '../../../core/models/login_model.dart';
import 'i_get_log_info_view_model.dart';

// ignore: camel_case_types
class getCusomerLoginViewModel with ChangeNotifier implements IGetCusomerLoginViewModel {
  ApiResponse<LoginModel> _customerLoginResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<LoginModel> get customerLoginResponse =>
      _customerLoginResponse;

  @override
  set customerLoginResponse(ApiResponse<LoginModel> value) {
    _customerLoginResponse = value;
    notifyListeners();
  }

  @override
  Future<void> customerLogin(eposta, sifre) async {
    try {
      final result = await locator<Api>().customerLogin(eposta, sifre);
      customerLoginResponse = ApiResponse.completed(result);
    } catch (e) {
      customerLoginResponse = ApiResponse.error(e.toString());
    }
  }

}

