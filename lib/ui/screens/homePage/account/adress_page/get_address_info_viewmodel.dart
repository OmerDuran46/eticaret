// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/yapilacak/get_adress_model.dart';
import 'package:eticaret/locator.dart';

import 'i_get_address_info_view_model.dart';

class getAddressInfoViewModel with ChangeNotifier implements IGetAddressInfoViewModel {
  ApiResponse<GetAdressModel> _getAddressResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<GetAdressModel> get getAddressResponse =>
      _getAddressResponse;

  @override
  set getAddressResponse(ApiResponse<GetAdressModel> value) {
    _getAddressResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getAddress() async {
    try {
      final result = await locator<Api>().getAddress();
      getAddressResponse = ApiResponse.completed(result);
    } catch (e) {
      getAddressResponse = ApiResponse.error(e.toString());
    }
  }

}

