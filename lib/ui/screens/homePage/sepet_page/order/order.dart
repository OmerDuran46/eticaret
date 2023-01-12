// ignore_for_file: unnecessary_import

import 'package:eticaret/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OrderPage extends ConsumerStatefulWidget {
  final String url;
  const OrderPage(this.url, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _OrderPageState();
}


class _OrderPageState extends ConsumerState<OrderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderLink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: 900,
        child: WebView(
          initialUrl: ref.read(iCustomerLoginWebInfoViewModel).customerLoginWebResponse.data.data![0]?.loginRedirectUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
  getOrderLink(){
    ref.read(iCustomerLoginWebInfoViewModel).customerLoginWeb();
  }
}
