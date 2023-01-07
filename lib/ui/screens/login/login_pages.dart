import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:eticaret/main.dart';
import 'package:eticaret/ui/screens/homePage/home.dart';

import '../../../core/api/api_response.dart';
import 'i_get_log_info_view_model.dart';

class CustomerLogin extends ConsumerStatefulWidget {
  const CustomerLogin({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CustomerLoginState();
}

class _CustomerLoginState extends ConsumerState<CustomerLogin> {
  TextEditingController _eposta = TextEditingController();
  TextEditingController _sifre = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _eposta = TextEditingController(text: "omer.duran@tsoft.com.tr");
    _sifre = TextEditingController(text: "Omer.456");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: Material(
        color: Colors.black87,
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Center(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  const Center(
                    child: Text(
                      "Üye Girişi ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _eposta,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Eposta",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _sifre,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(
                        Icons.remove_red_eye_outlined,
                      ),
                      hintText: "Şifre",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      customerLogin(_eposta.text, _sifre.text).then((value) {
                        loginWidget(ref.read(iGetCustomerLoginInfoViewModel));
                      });
                      // var box = Hive.box("CustomerLoginHive");
                      // box.put("sifre", _sifre.text);
                      // box.values.forEach((element) {
                      //   debugPrint(element.toString());
                      // });
                    },
                    child: const SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Center(
                        child: Text("Giriş"),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text("Şifremi unuttum"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Hesabınız yok mu?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Kayıt Ol",
                            style: TextStyle(
                              color: Colors.pink,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  customerLogin(eposta, sifre) async {
    await ref.read(iGetCustomerLoginInfoViewModel).customerLogin(eposta, sifre);
  }

  Object? loginWidget(IGetCusomerLoginViewModel iGetCusomerLoginViewModel) {
    if (iGetCusomerLoginViewModel.customerLoginResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetCusomerLoginViewModel.customerLoginResponse.status == Status.completed) {
      bool onay = iGetCusomerLoginViewModel.customerLoginResponse.data.success;

      if (onay == true) {
        String token = iGetCusomerLoginViewModel.customerLoginResponse.data.data[0].mobileToken;
        String customerId = iGetCusomerLoginViewModel.customerLoginResponse.data.data[0].id;
        String customerName = iGetCusomerLoginViewModel.customerLoginResponse.data.data[0].name;
        String customerSurname = iGetCusomerLoginViewModel.customerLoginResponse.data.data[0].surname;
        var box = Hive.box("CustomerLoginHive");
        box.put("sifre", token);
        box.put("customerId", customerId);
        box.put("customerName", customerName);
        box.put("customerSurName", customerSurname);

        return Fluttertoast.showToast(
                msg: "Giriş Başarılı",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0)
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        });
      } else if (onay == false) {
        return Fluttertoast.showToast(
            msg: "Kullanıcı adı veya parola hatalı!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      return const Center(
        child: Text("Login sayfası açılamadı."),
      );
    }
    return null;
  }
}
