import 'package:eticaret/core/constants/constants.dart';
import 'package:eticaret/ui/screens/homePage/account/contant_us/contant_us_page.dart';
import 'package:eticaret/ui/screens/homePage/account/price_alarm/price_alarm_page.dart';
import 'package:eticaret/ui/screens/homePage/account/stock_alarm/stock_alarm_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'account__setting_pages/acoount_setting_page.dart';
import 'acoount_control_page.dart';
import 'adress_page/adress_list_page.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  String? name;
  String? surName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomer();
  }
  getCustomer(){
     var box = Hive.box("CustomerLoginHive");
     name=box.get("customerName");
     surName=box.get("customerSurName");
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Hesabım",
          style: TextStyle(
            color: Colors.pink,
          ),
        ),
      ),
      body: buildListView(context),
    );
  }

  Widget buildListView(BuildContext context) {
    if (Constants.customerKey.isNotEmpty) {
      return ListView(
        children: [
          Material(
            color: Colors.grey.shade300,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountSettingPage(),
                      ),
                    );
                  },
                  child: Material(
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
                            Row(
                              children: [
                                Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.account_circle_outlined,
                                      size: 40,
                                      color: Colors.pink,
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    const Text(
                                      "Hesap Ayarları",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                     "$name $surName",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                            ),
                          ],
                        )),
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
                                child: Text("Türkçe"),
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
                    height: 730,
                    child: Column(
                      children: [
                        const ListTile(
                          leading: Icon(
                            Icons.card_giftcard,
                            color: Colors.pink,
                          ),
                          title: Text("Siparişlerim"),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
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
                                builder: (context) => const AddressListPage(),
                              ),
                            );
                          },
                          child: const ListTile(
                            leading: Icon(
                              Icons.location_on_outlined,
                              color: Colors.pink,
                            ),
                            title: Text("Adreslerim"),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.pink,
                          ),
                          title: Text("Son incelediğim ürünler"),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        const ListTile(
                          leading: Icon(
                            Icons.add_alert_outlined,
                            color: Colors.pink,
                          ),
                          title: Text("Bildirimler (0)"),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
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
                                  builder: (context) => const PricaAlarmPage(),
                                ));
                          },
                          child: const ListTile(
                            leading: Icon(
                              Icons.lightbulb_outline,
                              color: Colors.pink,
                            ),
                            title: Text("Fiyat Alarm Listem"),
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
                                  builder: (context) => const StockAlarmPage(),
                                ));
                          },
                          child: const ListTile(
                            leading: Icon(
                              Icons.notifications_active_outlined,
                              color: Colors.pink,
                            ),
                            title: Text("Stok Alarm Listem"),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                        ),
                        const Divider(color: Colors.grey),
                        const ListTile(
                          leading: Icon(
                            Icons.card_giftcard,
                            color: Colors.pink,
                          ),
                          title: Text("Hediye Çeklerim"),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ContantUsPage(),));
                        },
                          child: const ListTile(
                            leading: Icon(
                              Icons.warning_amber_outlined,
                              color: Colors.pink,
                            ),
                            title: Text("Bize Ulaşın"),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                        ),
                        const Divider(color: Colors.grey),
                        const ListTile(
                            leading: Icon(
                              Icons.phone_android,
                              color: Colors.pink,
                            ),
                            title: Text("Ugulama Hakkında"),
                            trailing: Icon(Icons.arrow_forward_ios_rounded)),
                        const Divider(color: Colors.grey),
                        InkWell(
                          onTap: () {
                            var box = Hive.box("CustomerLoginHive");
                            box.clear();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AccountControlPage(),
                                ),
                                (route) => false);
                          },
                          child: const ListTile(
                            leading: Icon(
                              Icons.exit_to_app,
                              color: Colors.pink,
                            ),
                            title: Text(
                              "Çıkış",
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return const AccountControlPage();
    }
  }
}
