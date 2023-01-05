import 'package:eticaret/core/models/get_stock_alarm_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/api/api_response.dart';

abstract class IGetStockAlarmInfoViewModel with ChangeNotifier{
  ApiResponse<StockAlarmModel> get getStockAlarmResponse;
  set getStockAlarmResponse(ApiResponse<StockAlarmModel> value);
  Future<void> getStockAlarm();
}