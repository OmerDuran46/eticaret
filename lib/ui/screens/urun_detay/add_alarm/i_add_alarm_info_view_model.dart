import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';

import '../../../../core/models/price_alarm_model.dart';


abstract class IAddAlarmInfoViewModel with ChangeNotifier{
  ApiResponse<PriceAlarmModel> get addAlarmResponse;
  set addAlarmResponse(ApiResponse<PriceAlarmModel> value);
  Future<void> addPriceAlarm(String productId,alarmDay,alarmPrice,productPrice);
}