// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/locator.dart';

import '../../../../../../core/models/yapilacak/delete_adress_model.dart';
import 'i_delete_address_info_viewmodel.dart';


class getDeleteAddressInfoViewModel with ChangeNotifier implements IGetDeleteAddressInfoViewModel {
  ApiResponse<DeleteAdressModel> _deleteAddressResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<DeleteAdressModel> get deleteAddressResponse =>
      _deleteAddressResponse;

  @override
  set deleteAddressResponse(ApiResponse<DeleteAdressModel> value) {
    _deleteAddressResponse = value;
    notifyListeners();
  }

  @override
  Future<void> deleteAddress(addressId) async {
    try {
      final result = await locator<Api>().deleteAddress(addressId);
      deleteAddressResponse = ApiResponse.completed(result);
    } catch (e) {
      deleteAddressResponse = ApiResponse.error(e.toString());
    }
  }

}

