// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/price_alarm_model.dart';
import 'package:eticaret/locator.dart';
import 'i_add_alarm_info_view_model.dart';


class addAlarmInfoViewModel with ChangeNotifier implements IAddAlarmInfoViewModel {
  ApiResponse<PriceAlarmModel> _addAlarmResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<PriceAlarmModel> get addAlarmResponse =>
      _addAlarmResponse;

  @override
  set addAlarmResponse(ApiResponse<PriceAlarmModel> value) {
    _addAlarmResponse = value;
    notifyListeners();
  }

  @override
  Future<void> addPriceAlarm(String productId,alarmDay,alarmPrice,productPrice) async {
    try {
      final result = await locator<Api>().addPriceAlarm(productId: productId,alarmDay: alarmDay,alarmPrice:alarmPrice,productPrice:  productPrice);
      addAlarmResponse = ApiResponse.completed(result);
    } catch (e) {
      addAlarmResponse = ApiResponse.error(e.toString());
    }
  }


}


