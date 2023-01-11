// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eticaret/core/constants/constants.dart';
import 'package:eticaret/ui/screens/homePage/account/login_control_page/login_control_page_cart.dart';
import 'package:eticaret/ui/screens/homePage/sepet_page/order/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../../core/api/api_response.dart';
import '../../../../main.dart';
import '../../../splash/splash.dart';
import 'i_get_cart_info_view_model.dart';

class CartPage extends ConsumerStatefulWidget {
  final String customerId;

  const CartPage(
    this.customerId, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  double? satisFiyati = 0.0;
  double? toplamFiyat = 0.0;
  double? genelToplamFiyat = 0.0;
  String loginControl = "false";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginControl = Constants.parolaGetir();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const Center(
              child: Text(
                "Sepeti Boşalt",
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ),
        ],
        title: const Text(
          "Sepetim",
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: getCartWidget1(
        ref.watch(iGetCartInfoViewModel),
        ref.watch(iGetApplicationLoginInfoViewModel),
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }

  Container floatingActionButton(BuildContext context) {
    if (loginControl == "false") {
      return Container();
    } else {
      return Container(
        width: (MediaQuery.of(context).size.width - 30) / 1,
        height: 90,
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Toplam Fiyat",
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                Text(
                  "${double.parse((toplamFiyat ?? (toplamFiyat = 0)).toStringAsFixed(3))}  TL",
                  style: const TextStyle(fontWeight: FontWeight.w200),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Genel Toplam",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  ("${double.parse((genelToplamFiyat ?? (genelToplamFiyat = 0)).toStringAsFixed(1))}  TL"),
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Constants().loading(context);
                customerLoginWeb().then((value){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(url!),));
                });


              },
              child: const SizedBox(
                width: double.infinity,
                child: Center(child: Text("Sepeti Onayla")),
              ),
            ),
          ],
        ),
      );
    }
  }

  getCart() {
    ref.read(iGetCartInfoViewModel).getCart(widget.customerId);
  }

  getCart2() {
    ref.watch(iGetCartInfoViewModel).getCart(widget.customerId);
  }
  String? url="";
  customerLoginWeb()async {
   await ref.read(iCustomerLoginWebInfoViewModel).customerLoginWeb();
    url=ref.read(iCustomerLoginWebInfoViewModel).customerLoginWebResponse.data.data?[0]?.loginRedirectUrl;
  }

  deleteCartItem(productId, variantId) async {
    Constants().loading(context);
    await ref.watch(iDeleteCartItemInfoViewModel).deleteCartItem(productId, variantId);
  }

  gelenMesaj(IDeleteCartItemInfoViewModel iDeleteCartItemInfoViewModel) {
    return iDeleteCartItemInfoViewModel.deleteCartItemResponse.data.message[0].text[0].toString();
  }

  Widget getCartWidget1(IGetCartInfoViewModel iGetCartInfoViewModel, IGetApplicationLoginViewModel iGetApplicationLoginViewModel) {
    if (loginControl == "false") {
      return LoginControlCartPage();
    } else {
      if (iGetCartInfoViewModel.getCartResponse.status == Status.loading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      } else if (iGetCartInfoViewModel.getCartResponse.status == Status.completed) {
        var product = iGetCartInfoViewModel.getCartResponse.data.data!.products;
        toplamFiyat = iGetCartInfoViewModel.getCartResponse.data.data!.priceCart;
        genelToplamFiyat = iGetCartInfoViewModel.getCartResponse.data.data!.priceGeneral;

        return Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
          height: 550,
          child: ListView.builder(
            itemCount: product!.length,
            padding: const EdgeInsets.all(1),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: Material(
                  elevation: 1,
                  shadowColor: Colors.white70,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: Colors.white10,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 100,
                          child: ListTile(
                            title: Text(product[index].title),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product[index].variantName),
                                Text(
                                  "${double.parse((product[index].priceSell * (1 + 18 / 100)).toStringAsFixed(2))} TL",
                                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            leading: Container(
                              width: 75,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                  product[index].image!.small,
                                )),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          endIndent: 10,
                          indent: 10,
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    deleteCartItem(
                                      product[index].id,
                                      product[index].variantId == 0 ? "" : product[index].variantId,
                                    ).then((value) {
                                      Fluttertoast.showToast(
                                          msg: gelenMesaj(ref.watch(iDeleteCartItemInfoViewModel)),
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      getApplicationToken(iGetApplicationLoginViewModel).then((value) {
                                        getCart2();
                                        Navigator.pop(context);
                                      });
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                  )),
                              Text(
                                "${product[index].count == 1 ? "" : double.parse((product[index].priceTotal).toStringAsFixed(2))}",
                              ),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        int oAnkiCount = product[index].count - 1;
                                        String oAnkiProductId = product[index].id;
                                        int oAnkiVariantId = product[index].variantId;
                                        deleteCartItem(product[index].id, product[index].variantId == 0 ? "" : product[index].variantId)
                                            .then((value) {
                                          getApplicationToken(iGetApplicationLoginViewModel).then((value) {
                                            addToCart(
                                                variantId: oAnkiVariantId == 0 ? "" : oAnkiVariantId,
                                                productCount: oAnkiCount,
                                                productId: oAnkiProductId)
                                                .then((value) {
                                              getCart2();
                                              Navigator.pop(context);
                                            });
                                          });
                                        });
                                      },
                                      child: const Icon(Icons.remove)),

                                  Text(
                                    "  ${product[index].count} Adet  ",
                                  ),
                                  InkWell(
                                      onTap: () {
                                        addToCart(
                                          variantId: product[index].variantId == 0 ? "" : product[index].variantId,
                                          productCount: 1,
                                          productId: product[index].id,
                                        );
                                        getApplicationToken(iGetApplicationLoginViewModel).then((value) {
                                          getCart2();
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: const Icon(Icons.add)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return const Center(child: Text("Sepet sayfası yüklenirken hata oluştu!"));
      }
    }
  }

  addToCart({productCount, productId, variantId}) async {
    Constants().loading(context);
    await ref.watch(iGetAddToCartInfoViewModel).addToCard(productCount, productId, variantId);
  }

  getApplicationToken(IGetApplicationLoginViewModel iGetApplicationLoginViewModel) async {
    await ref.read(iGetApplicationLoginInfoViewModel).applicationLogin();
    String token = iGetApplicationLoginViewModel.applicationLoginResponse.data.data[0].token;
    var applicationToken = Hive.box("ApplicationToken");
    applicationToken.put("token", token);

    Constants.tKey;
  }
}
