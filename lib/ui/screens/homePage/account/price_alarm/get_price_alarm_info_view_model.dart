
import 'package:flutter/cupertino.dart';

import '../../../../../core/api/api_response.dart';
import '../../../../../core/models/get_price_alarm_model.dart';

abstract class IGetPriceAlarmInfoViewModel with ChangeNotifier{
  ApiResponse<GetPriceAlarmModel> get getPriceAlarmResponse;
  set getPriceAlarmResponse(ApiResponse<GetPriceAlarmModel> value);
  Future<void> getPriceAlarm();
}