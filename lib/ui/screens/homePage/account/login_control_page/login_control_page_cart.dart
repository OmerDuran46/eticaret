import 'package:eticaret/ui/screens/login/login_pages.dart';
import 'package:eticaret/ui/screens/member_registration/member_registration_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginControlCartPage extends ConsumerStatefulWidget {
  const LoginControlCartPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginControlCartPageState();
}

class _LoginControlCartPageState extends ConsumerState<LoginControlCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Icon(Icons.favorite, color: Colors.red, size: 75),
            const SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 50,
              child: const Text(
                "Sepet Sayfası",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 50,
              child: const Text(
                "için lütfen giriş yapın.",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 160,
              height: 40,
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
                    style: const TextStyle(color: Colors.black),
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
                    style: const TextStyle(color: Colors.black),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
