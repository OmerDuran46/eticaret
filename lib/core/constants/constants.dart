import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


class Constants{

  loading(context) {
    return showDialog(
      context: context,
      builder: (context) => const CupertinoActivityIndicator(),
    );
  }

 static String parolaGetir(){
    var box =  Hive.box("CustomerLoginHive");

    String parola= box.get("sifre") ?? "false";
    return parola;

  }
 static String  applicationTokenGet() {
   var box = Hive.box("ApplicationToken");
   String applicationToken=box.get("token");
  return applicationToken;
 }
 static getCustomerId(){
   var box=Hive.box("CustomerLoginHive");
   var customerId=box.get("customerId");
   return customerId;
 }
  static String tKey=applicationTokenGet();
  static String customerKey=parolaGetir();
  static String tDomain="";
}
