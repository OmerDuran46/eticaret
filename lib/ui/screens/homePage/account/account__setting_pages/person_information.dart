import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eticaret/main.dart';
import 'package:eticaret/ui/screens/homePage/account/account__setting_pages/i_update_customer_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/get_customer/i_get_product_info_view_model.dart';
import '../../../../../core/api/api_response.dart';

class PersonInformation extends ConsumerStatefulWidget {
  const PersonInformation({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PersonInformationState();
}

class _PersonInformationState extends ConsumerState<PersonInformation> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurName = TextEditingController();
  TextEditingController controllerMobile = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerPostcode = TextEditingController();
  String? name;
  String? surname;
  String? mobile;
  String? email;
  String? phone;
  String? address;
  String? postcode;
  String? updateMessage;
  late String isim;
  final formKey = GlobalKey<FormState>();
  bool checkState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomer();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    ref.read(iGetCustomerInfoViewModel).getcustomerResponse.status = Status.loading;
   // ref.read(iGetUpdateCustomerInfoViewModel).updateCustomerResponse.status = Status.loading;
  }

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
          "Kişisel Bilgiler",
          style: TextStyle(
            color: Colors.pink,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: getCustomerDetailWidget(ref.watch(iGetCustomerInfoViewModel), ref.read(iGetUpdateCustomerInfoViewModel)),
    );
  }

  getCustomerSetState() {
    ref.read(iGetCustomerInfoViewModel).getCustomer();
  }

  getCustomer() {
    ref.read(iGetCustomerInfoViewModel).getCustomer();
  }

   updateCustomer() async{

   await ref.read(iGetUpdateCustomerInfoViewModel).updateCustomer(
          controllerName.text,
          controllerSurName.text,
          controllerEmail.text,
          controllerPhone.text,
          controllerMobile.text,
          controllerAddress.text,
          controllerPostcode.text,
        );
  }
  Widget getCustomerDetailWidget(IGetCustomerInfoViewModel iGetCustomerInfoViewModel, IGetUpdateCustomerInfoViewModel iGetUpdateCustomerInfoViewModel) {
    if (iGetCustomerInfoViewModel.getcustomerResponse.status == Status.loading) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (iGetCustomerInfoViewModel.getcustomerResponse.status == Status.completed) {
      controllerName = TextEditingController(text: iGetCustomerInfoViewModel.getcustomerResponse.data.data![0].name);
      controllerSurName = TextEditingController(text: iGetCustomerInfoViewModel.getcustomerResponse.data.data![0].surname);
      controllerMobile = TextEditingController(text: iGetCustomerInfoViewModel.getcustomerResponse.data.data![0].mobile);
      controllerEmail = TextEditingController(text: iGetCustomerInfoViewModel.getcustomerResponse.data.data![0].email);
      controllerPhone = TextEditingController(text: iGetCustomerInfoViewModel.getcustomerResponse.data.data![0].phone);
      controllerAddress = TextEditingController(text: iGetCustomerInfoViewModel.getcustomerResponse.data.data![0].address);
      controllerPostcode = TextEditingController(text: iGetCustomerInfoViewModel.getcustomerResponse.data.data![0].postcode);



      return Material(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "İsminiz",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 3) return "İsim en az 3 karakter olmalıdır";
                    return null;
                  },
                  onSaved: (data) => name = data!,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controllerSurName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Soyisminiz",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 3) return "Soyismiz en az 3 karakter olmalıdır";
                    return null;
                  },
                  onSaved: (data) => surname = data!,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controllerMobile,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Cep Telefonu",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 10) return "Cep telefonu en az 10 karakter olmalıdır";
                    return null;
                  },
                  onSaved: (data) => mobile = data!,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    hintText: "mail@",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  validator: (value) {
                    if (!value!.contains('@') && !value.contains('.com')) return "Geçerli bir eposta adresi giriniz ömer";
                    return null;
                  },
                  onSaved: (data) => email = data!,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controllerPhone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "İş Telefonu",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 10) return "Telefon no en az 10 karakter olmalıdır";
                    return null;
                  },
                  onSaved: (data) => phone = data!,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controllerAddress,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: "Adres",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controllerPostcode,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Posta Kodu",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  onSaved: (data) => address = data!,
                ),
                CheckboxListTile(
                  value: checkState,
                  title: const Text("KVKK metnini" " okudum onaylıyorum."),
                  onChanged: (state) {
                    setState(() {
                      checkState = state!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                              updateCustomer().then((value)async {

                              if(iGetUpdateCustomerInfoViewModel.updateCustomerResponse.status==Status.loading){
                                debugPrint(iGetUpdateCustomerInfoViewModel.updateCustomerResponse.status.toString());
                              } if (iGetUpdateCustomerInfoViewModel.updateCustomerResponse.status==Status.completed){
                                setState(() {
                                  String mesaj=iGetUpdateCustomerInfoViewModel.updateCustomerResponse.data.message![0].text![0].toString();

                                  Fluttertoast.showToast(
                                      msg: mesaj,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                });
                              }

                              });

                              getCustomerSetState();

                          }
                        },
                        icon: const Icon(Icons.check),
                        label: const Text("Kaydet"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
