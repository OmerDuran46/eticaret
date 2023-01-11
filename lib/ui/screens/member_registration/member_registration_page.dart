import 'package:eticaret/main.dart';
import 'package:eticaret/ui/screens/homePage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class MemberRegistrationPage extends ConsumerStatefulWidget {
  const MemberRegistrationPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MemberRegistrationPageState();
}

class _MemberRegistrationPageState extends ConsumerState<MemberRegistrationPage> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurName = TextEditingController();
  TextEditingController controllerCepTelefonu = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSifre = TextEditingController();
  TextEditingController controllerSifreTekrar = TextEditingController();
  String? name;
  String? surname;
  String? cepTelefonu;
  String? email;
  String? sifre;
  String? sifreTekrar;
  String? updateMessage;
  bool bilgilendirmeEposta = false;
  bool bilgilendirmeSms = false;
  bool bilgilendirmeTelefonArama = false;
  bool kvkk = false;
  bool sifreGizle = false;
  bool sifreTekrarGizle = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Ad *",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: controllerName,
                    decoration: const InputDecoration(
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(15))),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 3) return "İsim en az 3 karakter olmalıdır";
                      return null;
                    },
                    onSaved: (data) => name = data!,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Soyad *",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: controllerSurName,
                    decoration: const InputDecoration(
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(15))),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 3) return "Soyismiz en az 3 karakter olmalıdır";
                      return null;
                    },
                    onSaved: (data) => surname = data!,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Cep Telefonu",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: controllerCepTelefonu,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(15))),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 10) return "Cep telefonu en az 10 karakter olmalıdır";
                      return null;
                    },
                    onSaved: (data) => cepTelefonu = data!,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Email",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(15))),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (!value!.contains('@') && !value.contains('.com')) return "Geçerli bir eposta adresi giriniz ömer";
                      return null;
                    },
                    onSaved: (data) => email = data!,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Şifre",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: controllerSifre,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: sifreGizle,
                    decoration:  InputDecoration(
                      suffixIcon: InkWell(onTap: () {
                        setState(() {
                          if(sifreGizle==true){

                            sifreGizle=false;
                          }else{
                            sifreGizle=true;
                          }
                        });
                      },
                        child:  Icon(
                         sifreGizle==true?Icons.remove_red_eye_outlined:Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Şifre Tekrar *",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: controllerSifreTekrar,
                    obscureText: sifreTekrarGizle,
                    keyboardType: TextInputType.visiblePassword,
                    decoration:  InputDecoration(
                      suffixIcon: InkWell(onTap: () {
                        setState(() {
                          if(sifreTekrarGizle==true){

                            sifreTekrarGizle=false;
                          }else{
                            sifreTekrarGizle=true;
                          }
                        });

                      },
                        child:  Icon(
                          sifreTekrarGizle==true?Icons.remove_red_eye_outlined:Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Colors.transparent,
                  value: bilgilendirmeEposta,
                  title: const Text(
                    "Bilgilendirme e-postalarını almak istiyorum.",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (state) {
                    setState(() {
                      bilgilendirmeEposta = state!;
                    });
                  },
                ),
                CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Colors.transparent,
                  value: bilgilendirmeSms,
                  title: const Text(
                    "Bilgilendirme smslerini almak istiyorum.",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (state) {
                    setState(() {
                      bilgilendirmeSms = state!;
                    });
                  },
                ),
                CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Colors.transparent,
                  value: bilgilendirmeTelefonArama,
                  title: const Text(
                    "Bilgilendirme aramalarını almak istiyorum.",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (state) {
                    setState(() {
                      bilgilendirmeTelefonArama = state!;
                    });
                  },
                ),
                CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Colors.transparent,
                  value: kvkk,
                  title: const Text(
                    "KVKK metnini" " okudum onaylıyorum.",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (state) {
                    setState(() {
                      kvkk = state!;
                    });
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            createCustomer().then((value) {
                              bool success = ref.read(iCreateCustomerInfoViewModel).createCustomerResponse.data.success;
                              if(success==true){
                                gelenCevap();
                              }else{
                                Fluttertoast.showToast(
                                    msg: ref.read(iCreateCustomerInfoViewModel).createCustomerResponse.data.message[0].text[0].toString(),
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                              }
                          


                            });
                          }
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Kaydet",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  createCustomer() async {
    await ref.watch(iCreateCustomerInfoViewModel).createCustomer(
        controllerName.text,
        controllerSurName.text,
        controllerEmail.text,
        controllerSifre.text,
        controllerCepTelefonu.text,
        bilgilendirmeEposta.toString(),
        bilgilendirmeSms.toString(),
        bilgilendirmeTelefonArama.toString());
  }
  getCustomer() async {
   await ref.read(iGetCustomerInfoViewModel).getCustomer();
  }

  gelenCevap()  {
    var box = Hive.box("CustomerLoginHive");
    var uye=ref.read(iCreateCustomerInfoViewModel).createCustomerResponse.data.data[0];
    String customerId = uye.customerId;
    String mobileToken = uye.mobileToken;
    box.put("sifre", mobileToken);
    box.put("customerId", customerId);
    getCustomer().then((value){
      String customerName = ref.read(iGetCustomerInfoViewModel).getcustomerResponse.data.data![0].name;
      String customerSurName= ref.read(iGetCustomerInfoViewModel).getcustomerResponse.data.data![0].surname;

      box.put("customerName", customerName);
      box.put("customerSurName", customerSurName);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage(),), (route) => false);
    });



  }
}
