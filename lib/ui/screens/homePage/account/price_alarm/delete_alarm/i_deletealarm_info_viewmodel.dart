
import 'package:eticaret/core/models/delete_alarm_model.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../core/api/api.dart';
import '../../../../../../core/api/api_response.dart';
import '../../../../../../locator.dart';
import 'i_delete_alarm_info_View_Model.dart';

// ignore: camel_case_types
class deleteAlarmInfoViewModel with ChangeNotifier implements IDeleteAlarmInfoViewModel {
  ApiResponse<DeleteAlarmModel> _deleteAlarmResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<DeleteAlarmModel> get deleteAlarmResponse =>
      _deleteAlarmResponse;

  @override
  set deleteAlarmResponse(ApiResponse<DeleteAlarmModel> value) {
    _deleteAlarmResponse = value;
    notifyListeners();
  }

  @override
  Future<void> deleteAlarm(alarmId) async {
    try {
      final result = await locator<Api>().deleteAlarm(alarmId);
      deleteAlarmResponse = ApiResponse.completed(result);
    } catch (e) {
      deleteAlarmResponse = ApiResponse.error(e.toString());
    }
  }
}