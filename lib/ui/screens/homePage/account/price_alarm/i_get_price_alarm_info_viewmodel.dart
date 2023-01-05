
import 'package:flutter/cupertino.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/api/api_response.dart';
import '../../../../../core/models/get_price_alarm_model.dart';
import '../../../../../locator.dart';
import 'get_price_alarm_info_view_model.dart';

// ignore: camel_case_types
class getPriceAlarmInfoViewModel with ChangeNotifier implements IGetPriceAlarmInfoViewModel {
  ApiResponse<GetPriceAlarmModel> _getPriceAlarmResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<GetPriceAlarmModel> get getPriceAlarmResponse =>
      _getPriceAlarmResponse;

  @override
  set getPriceAlarmResponse(ApiResponse<GetPriceAlarmModel> value) {
    _getPriceAlarmResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getPriceAlarm() async {
    try {
      final result = await locator<Api>().getPriceAlarm();
      getPriceAlarmResponse = ApiResponse.completed(result);
    } catch (e) {
      getPriceAlarmResponse = ApiResponse.error(e.toString());
    }
  }


}