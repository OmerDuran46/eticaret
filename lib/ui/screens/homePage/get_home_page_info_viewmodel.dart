// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/applicationLogin.dart';
import 'package:eticaret/core/models/home_model.dart';
import 'package:eticaret/locator.dart';
import 'i_get_home_page_info_view_model.dart';


class getIndexInfoViewModel with ChangeNotifier implements IGetIndexInfoViewModel {
  ApiResponse<HomeModel> _indexResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<HomeModel> get indexResponse =>
      _indexResponse;

  @override
  set indexResponse(ApiResponse<HomeModel> value) {
    _indexResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getIndex() async {
    try {
      final result = await locator<Api>().getIndex();
      indexResponse = ApiResponse.completed(result);
    } catch (e) {
      indexResponse = ApiResponse.error(e.toString());
    }
  }
}
class getApplicationLoginInfoViewModel with ChangeNotifier implements IGetApplicationLoginInfoViewModel {
  ApiResponse<ApplicationModel> _applicationLoginResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<ApplicationModel> get applicationLoginResponse =>
      _applicationLoginResponse;

  @override
  set applicationLoginResponse(ApiResponse<ApplicationModel> value) {
    _applicationLoginResponse = value;
    notifyListeners();
  }

  @override
  Future<void> applicationLogin() async {
    try {
      final result = await locator<Api>().applicationLogin();
      applicationLoginResponse = ApiResponse.completed(result);
    } catch (e) {
      applicationLoginResponse = ApiResponse.error(e.toString());
    }
  }
}



