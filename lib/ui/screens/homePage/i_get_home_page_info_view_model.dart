import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/applicationLogin.dart';
import 'package:eticaret/core/models/home_model.dart';


abstract class IGetIndexInfoViewModel with ChangeNotifier{
  ApiResponse<HomeModel> get indexResponse;
  set indexResponse(ApiResponse<HomeModel> value);
  Future<void> getIndex();
}
abstract class IGetApplicationLoginInfoViewModel with ChangeNotifier{
  ApiResponse<ApplicationModel> get applicationLoginResponse;
  set applicationLoginResponse(ApiResponse<ApplicationModel> value);
  Future<void> applicationLogin();
}