
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../ui/splash/splash.dart';

class Constants{

 static parolaGetir(){
    var box = Hive.box("CustomerLoginHive");
    var parola=box.get("sifre");
    return parola;
  }
 static String  applicationTokenGet() {
   var box = Hive.box("ApplicationToken");
   String applicationToken=box.get("token");

  return applicationToken;

 }
 static getApplicationToken(IGetApplicationLoginViewModel iGetApplicationLoginViewModel) async {
   String token = iGetApplicationLoginViewModel.applicationLoginResponse.data.data[0].token;
   var applicationToken = Hive.box("ApplicationToken");
   applicationToken.put("token", token);
   String yeniToken=applicationToken.get("token");
   Constants.tKey;
   debugPrint(yeniToken);
   debugPrint(Constants.applicationTokenGet());
 }

 static getCustomerId(){
   var box=Hive.box("CustomerLoginHive");
   var customerId=box.get("customerId");
   return customerId;
 }


  static String tKey=applicationTokenGet();
  static String customerKey=parolaGetir();
  static String tDomain="http://omerduran.1ticaret.com/";
}