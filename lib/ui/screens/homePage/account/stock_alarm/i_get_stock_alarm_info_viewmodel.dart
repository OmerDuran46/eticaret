import 'package:eticaret/core/models/get_stock_alarm_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/api/api.dart';
import '../../../../../core/api/api_response.dart';
import '../../../../../locator.dart';
import 'get_stock_alarm_info_view_model.dart';

// ignore: camel_case_types
class getStockAlarmInfoViewModel with ChangeNotifier implements IGetStockAlarmInfoViewModel {
  ApiResponse<StockAlarmModel> _getStockAlarmResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<StockAlarmModel> get getStockAlarmResponse =>
      _getStockAlarmResponse;

  @override
  set getStockAlarmResponse(ApiResponse<StockAlarmModel> value) {
    _getStockAlarmResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getStockAlarm() async {
    try {
      final result = await locator<Api>().getStockAlarm();
      getStockAlarmResponse = ApiResponse.completed(result);
    } catch (e) {
      getStockAlarmResponse = ApiResponse.error(e.toString());
    }
  }


}