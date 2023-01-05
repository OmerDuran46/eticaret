import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';

import '../../../core/models/login_model.dart';



abstract class IGetCusomerLoginViewModel with ChangeNotifier{
  ApiResponse<LoginModel> get customerLoginResponse;
  set customerLoginResponse(ApiResponse<LoginModel> value);
  Future<void> customerLogin(eposta,sifre);
}