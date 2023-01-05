

// ignore_for_file: file_names

import 'package:eticaret/core/models/delete_alarm_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/api/api_response.dart';


abstract class IDeleteAlarmInfoViewModel with ChangeNotifier{
  ApiResponse<DeleteAlarmModel> get deleteAlarmResponse;
  set deleteAlarmResponse(ApiResponse<DeleteAlarmModel> value);
  Future<void> deleteAlarm(alarmId);
}