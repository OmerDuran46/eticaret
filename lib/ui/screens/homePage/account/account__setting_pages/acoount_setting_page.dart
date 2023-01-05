// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eticaret/ui/screens/homePage/account/account__setting_pages/person_information.dart';
import 'package:eticaret/ui/screens/homePage/account/account__setting_pages/update_password.dart';

class AccountSettingPage extends ConsumerStatefulWidget {
  const AccountSettingPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends ConsumerState<AccountSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.pink,
              )),
          title: const Text(
            "Hesap Ayarları",
            style: TextStyle(color: Colors.pink),
          ),
          centerTitle: true,
          backgroundColor: Colors.white),
      body: Material(
        elevation: 1,
        child: Container(
            width: double.infinity,
            height: 330,
            margin: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PersonInformation(),
                        ));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.account_box_outlined,
                      color: Colors.pink,
                    ),
                    title: Text("Kişisel Bilgiler"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdatePasswordPage(),
                        ));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.assignment_return,
                      color: Colors.pink,
                    ),
                    title: Text("Şifre Değiştir"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
