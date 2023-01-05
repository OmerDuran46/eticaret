// ignore_for_file: camel_case_types, must_call_super

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eticaret/main.dart';

import '../../../../../core/api/api_response.dart';
import 'i_get_address_info_view_model.dart';

class AddressListPage extends ConsumerStatefulWidget {
  const AddressListPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _Address_list_pageState();
}

class _Address_list_pageState extends ConsumerState<AddressListPage> {
  @override
  void initState() {
    // TODO: implement initState
    getAddres();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    ref.read(iGetAddressInfoViewModel).getAddressResponse.status = Status.loading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.pink,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: const Text(
            "Adreslerim",
            style: TextStyle(color: Colors.pink),
          ),
          actions: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: const Text(
                  "Adres Ekle",
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ),
          ],
        ),
        body: getAdressWidget(ref.watch(iGetAddressInfoViewModel)));
  }

  Widget getAdressWidget(IGetAddressInfoViewModel iGetAddressInfoViewModel) {
    if (iGetAddressInfoViewModel.getAddressResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetAddressInfoViewModel.getAddressResponse.status == Status.completed) {
      var addressList = iGetAddressInfoViewModel.getAddressResponse.data.data;
      return ListView.builder(
        itemCount: addressList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: (MediaQuery.of(context).size.height - 20) / 2,
                height: 150,
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              addressList[index].fullname,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.pink,
                              ),
                            ),
                            Text(
                              addressList[index].mobilePhone,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              " ${"${addressList[index].district} / ${addressList[index].town} / ${addressList[index].city} / ${addressList[index].country}"}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              addressList[index].address,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return [
                             const PopupMenuItem(child: Text("Düzenle")),

                            PopupMenuItem(
                              child: TextButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Icon(
                                      Icons.location_off,
                                      color: Colors.pink,
                                    ),
                                    content: const Text('Adresi silmek istediğinize emin misiniz?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                        child: const Text('Hayır'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          deleteAddres(addressList[index].id);
                                          getAddres();
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Evet'),
                                      ),
                                    ],
                                  ),
                                ),
                                child: const Text(textAlign: TextAlign.left,'Sil',style: TextStyle(color: Colors.black87),),
                              ),
                            ),
                          ];
                        },
                        child: const Icon(Icons.more_horiz)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    } else {
      return const Center(child: Text("Adress sayfası yüklenirken hata oluştu."));
    }
  }

  getAddres() {
    ref.read(iGetAddressInfoViewModel).getAddress();
  }

  deleteAddres(addressId) {
    ref.watch(iGetDeleteAddressInfoViewModel).deleteAddress(addressId);
  }
}
