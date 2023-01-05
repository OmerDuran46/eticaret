import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../login/login_pages.dart';
import '../../member_registration/member_registration_page.dart';

class AccountControlPage extends ConsumerStatefulWidget {
  const AccountControlPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AccountControlPageState();
}

class _AccountControlPageState extends ConsumerState<AccountControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Material(
            color: Colors.grey.shade200,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Material(
                  elevation: 1,
                  shadowColor: Colors.black12,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    margin: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            "HOŞGELDİNİZ",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: Text(
                            "Siparişleriniz ve size özel fırsatları",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "görüntülemek için hemen giriş yapın!",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 160,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "GİRİŞ YAP",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CustomerLogin(),
                                      ),
                                    );
                                  },
                                style: const TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: "/ KAYIT OL",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MemberRegistrationPage(),
                                      ),
                                    );
                                  },
                                style: const TextStyle(color: Colors.white),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Material(
                  elevation: 1,
                  shadowColor: Colors.black12,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    margin: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Dil",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Türkçe",
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Material(
                  elevation: 1,
                  shadowColor: Colors.black12,
                  child: SizedBox(
                    width: double.infinity,
                    height: 285,
                    child: Column(
                      children: const [
                        ListTile(
                          leading: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.pink,
                          ),
                          title: Text(
                            "Son incelediğim ürünler",
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.add_alert_outlined,
                            color: Colors.pink,
                          ),
                          title: Text(
                            "Bildirimler (0)",
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.warning_amber_outlined,
                            color: Colors.pink,
                          ),
                          title: Text(
                            "Bize Ulaşın",
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.phone_android,
                            color: Colors.pink,
                          ),
                          title: Text(
                            "Ugulama Hakkında",
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
