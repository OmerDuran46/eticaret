// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:eticaret/core/models/applicationLogin.dart';
import 'package:eticaret/main.dart';
import 'package:eticaret/ui/screens/homePage/home.dart';
import '../../core/api/api.dart';
import '../../core/api/api_response.dart';
import '../../locator.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApplicationToken().then((value) {
      splashWidget(ref.read(iGetApplicationLoginInfoViewModel));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/tsoft-logo-tr.jpg"),
          ],
        ),
      ),
    );
  }

  getApplicationToken() async {
    await ref.read(iGetApplicationLoginInfoViewModel).applicationLogin();
  }

  splashWidget(IGetApplicationLoginViewModel iGetApplicationLoginViewModel) {
    if (iGetApplicationLoginViewModel.applicationLoginResponse.status == Status.completed) {
      String token = iGetApplicationLoginViewModel.applicationLoginResponse.data.data[0].token;
      var applicationToken = Hive.box("ApplicationToken");
      applicationToken.put("token", token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      return const Center(
        child: Text(
          "Uygulamaya girişte bir hata oluştu.",
        ),
      );
    }
  }
}

abstract class IGetApplicationLoginViewModel with ChangeNotifier {
  ApiResponse<ApplicationModel> get applicationLoginResponse;

  set applicationLoginResponse(ApiResponse<ApplicationModel> value);

  Future<void> applicationLogin();
}

class getApplicationLoginViewModel with ChangeNotifier implements IGetApplicationLoginViewModel {
  ApiResponse<ApplicationModel> _applicationLoginResponse = ApiResponse.loading("loading");

  @override
  ApiResponse<ApplicationModel> get applicationLoginResponse => _applicationLoginResponse;

  @override
  set applicationLoginResponse(ApiResponse<ApplicationModel> value) {
    _applicationLoginResponse = value;
    notifyListeners();
  }

  @override
  Future<void> applicationLogin() async {
    try {
      final result = await locator<Api>().applicationLogin();
      applicationLoginResponse = ApiResponse.completed(result);
    } catch (e) {
      applicationLoginResponse = ApiResponse.error(e.toString());
    }
  }
}
