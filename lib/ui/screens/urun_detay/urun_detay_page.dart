import 'package:cached_network_image/cached_network_image.dart';
import 'package:eticaret/ui/screens/homePage/addToCart/i_search_info_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eticaret/core/constants/constants.dart';
import 'package:eticaret/main.dart';
import 'package:eticaret/ui/screens/add_favorite/i_add_favori_info_view_model.dart';
import 'package:eticaret/ui/screens/get_favori_pages/i_get_favori_info_view_model.dart';
import 'package:eticaret/ui/screens/urun_detay/getAciklamaPage/urun_aciklama_page.dart';
import 'package:eticaret/ui/screens/urun_detay/i_get_urun_details_page_info_view_model.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/api/api_response.dart';
import '../get_product_list/i_get_product_info_view_model.dart';

class UrunDetayPage extends ConsumerStatefulWidget {
  final String urunId;

  const UrunDetayPage({
    required this.urunId,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _UrunDetayPageState();
}

const List<String> listAdet = <String>["1", "2", "3", "4", "5", "6", "7", "8", "9"];

class _UrunDetayPageState extends ConsumerState<UrunDetayPage> {
  final TextEditingController _fiyatController = TextEditingController();
  final TextEditingController _gunController = TextEditingController();

  String dropdownValueAdet = listAdet.first;
  bool favoriEkli = false;
  int? altUrunVarMi = 0;
  String? nitelik2varMi = "0";
  late dynamic stok;
  late String resimUrl;
  late String urunAdi;
  late String urunFiyat;
  String? gender;
  String? secilenTypeId = "";
  String? nitelik1Title = "Renk Seçiniz..";
  String? secilenTypeIdB = "";
  String? nitelik1TitleB = "Beden Seçiniz..";
  int? secilenindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProdutDetails();
    getProduct();
    getfavori();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    ref.read(iGetUrunDetailsInfoViewModel).urunDetailsResponse.status = Status.loading;
    ref.read(iGetFavoriInfoViewModel).favoriResponse.status = Status.loading;
    ref.read(iGetProductInfoViewModel).productFindResponse.status = Status.loading;
    ref.read(iAddFavoriInfoViewModel).addFavoriResponse.status = Status.loading;
    ref.read(iGetDeleteFavoriInfoViewModel).deleteFavoriResponse.status = Status.loading;
    ref.read(iGetAddToCartInfoViewModel).addToCartResponse.status = Status.loading;
  }

  void _onShare(BuildContext context, String link) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(link, sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  Widget detailPageWidget(IGetUrunDetailsInfoViewModel iGetUrunDetailsInfoViewModel, IGetFavoriInfoViewModel iGetFavoriInfoViewModel,
      IAddFavoriInfoViewModel addFavoriInfoViewModel, IGetProductInfoViewModel iGetProductInfoViewModel) {
    if (iGetUrunDetailsInfoViewModel.urunDetailsResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetUrunDetailsInfoViewModel.urunDetailsResponse.status == Status.completed) {
      stok = iGetUrunDetailsInfoViewModel.urunDetailsResponse.data.data![0].stock;

      urunAdi = iGetUrunDetailsInfoViewModel.urunDetailsResponse.data.data![0].productName;
      urunFiyat = iGetUrunDetailsInfoViewModel.urunDetailsResponse.data.data![0].sellingPriceVatIncluded;
      String urunKodu = iGetUrunDetailsInfoViewModel.urunDetailsResponse.data.data![0].productCode;
      String urunResmi = iGetUrunDetailsInfoViewModel.urunDetailsResponse.data.data![0].imageUrl;
      String urunId = iGetUrunDetailsInfoViewModel.urunDetailsResponse.data.data![0].productId;
      var seoLink = iGetUrunDetailsInfoViewModel.urunDetailsResponse.data.data![0].seoLink;
      resimUrl = Constants.tDomain + urunResmi;
      return ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(resimUrl),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Material(
                elevation: 1,
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  height: 50,
                  width: (MediaQuery.of(context).size.width - 10) / 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        urunAdi,
                        style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 17),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            "Ürün Kodu:  ",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(urunKodu.toString()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              nitelik1(iGetProductInfoViewModel),
              const SizedBox(
                height: 5,
              ),
              nitelik2(iGetProductInfoViewModel),
              const SizedBox(
                height: 5,
              ),
              Material(
                elevation: 1,
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(left: 15, top: 5, right: 10),
                  height: 90,
                  width: (MediaQuery.of(context).size.width - 10) / 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Adet",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        child: DropdownButton(
                          isExpanded: true,
                          value: dropdownValueAdet,
                          icon: const Icon(Icons.arrow_downward_sharp),
                          elevation: 16,
                          underline: Container(
                            height: 20,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValueAdet = value!;
                            });
                          },
                          items: listAdet.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Material(
                elevation: 1,
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  height: 70,
                  width: (MediaQuery.of(context).size.width - 10) / 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              _onShare(context, Constants.tDomain + seoLink);
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.share,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Paylaş",
                                  style: TextStyle(color: Colors.black45),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (favoriEkli == false) {
                                addFavorite().then((value) {
                                  setState(() {
                                    getfavori1();

                                    debugPrint(favoriEkli.toString());
                                    Navigator.pop(context);
                                  });
                                });
                                // ref.watch(iAddFavoriInfoViewModel).addFavorite(widget.urunId);

                              }
                              if (favoriEkli == true) {
                                deleteFavori().then((value) {
                                  setState(() {
                                    getfavori1();
                                    debugPrint(favoriEkli.toString());
                                    Navigator.pop(context);
                                  });
                                });
                              }
                            },
                            child: Column(
                              children: [
                                favoriListWidget(iGetFavoriInfoViewModel),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text("Favori Ekle", style: TextStyle(color: Colors.black45))
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    alignment: Alignment.center,
                                    actions: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.only(top: 5, left: 5),
                                              alignment: Alignment.topLeft,
                                              height: 330,
                                              width: (MediaQuery.of(context).size.width),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      "Fiyat Alarm",
                                                      style: TextStyle(color: Colors.black45, fontSize: 20),
                                                    ),
                                                    Text(
                                                      "$urunFiyat TL (KDV Dahil)",
                                                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextField(
                                                      controller: _fiyatController,
                                                      decoration: InputDecoration(
                                                        hintText: "Alarm Fiyatı (KDV Dahil)",
                                                        border: OutlineInputBorder(
                                                          borderSide: const BorderSide(width: 1, color: Colors.red),
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextField(
                                                      controller: _gunController,
                                                      decoration: InputDecoration(
                                                        hintText: "Geçerlilik Süresi (Gün)",
                                                        border: OutlineInputBorder(
                                                          borderSide: const BorderSide(width: 1, color: Colors.red),
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          ref
                                                              .watch(iAddAlarmInfoViewModel)
                                                              .addPriceAlarm(widget.urunId, _gunController.text, _fiyatController.text, urunFiyat);
                                                          Fluttertoast.showToast(
                                                              msg: "Fiyat alarmı başarılı bir şekilde oluşturuldu.",
                                                              toastLength: Toast.LENGTH_SHORT,
                                                              gravity: ToastGravity.CENTER,
                                                              timeInSecForIosWeb: 1,
                                                              backgroundColor: Colors.green,
                                                              textColor: Colors.white,
                                                              fontSize: 16.0);
                                                          Navigator.pop(context);
                                                        },
                                                        child: const SizedBox(width: double.infinity, child: Center(child: Text("Tamam")))),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: const SizedBox(width: double.infinity, child: Center(child: Text("Vazgeç")))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(Icons.alarm_rounded),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Fiyat Alarm", style: TextStyle(color: Colors.black45))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Material(
                elevation: 1,
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  height: 200,
                  width: (MediaQuery.of(context).size.width - 10) / 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UrunAciklamaPage(urunId: urunId),
                                ),
                              );
                            },
                            child: const ListTile(
                              title: Text("Ürün Açıklamaları", style: TextStyle(fontSize: 18)),
                              trailing: Icon(Icons.arrow_forward),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UrunAciklamaPage(urunId: urunId),
                                ),
                              );
                            },
                            child: const ListTile(
                              title: Text("Ödeme Seçenekleri", style: TextStyle(fontSize: 18)),
                              trailing: Icon(
                                Icons.arrow_forward,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UrunAciklamaPage(urunId: urunId),
                                ),
                              );
                            },
                            child: const ListTile(
                              title: Text("Ürün Değerlendirmeleri", style: TextStyle(fontSize: 18)),
                              trailing: Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          )
        ],
      );
    } else {
      return const Center(
        child: Text("Ürün detayı gelirken hata oluştu"),
      );
    }
  }

  Widget urunFiyatiWidget(IGetUrunDetailsInfoViewModel iGetUrunDetailsInfoViewModel) {
    if (iGetUrunDetailsInfoViewModel.urunDetailsResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetUrunDetailsInfoViewModel.urunDetailsResponse.status == Status.completed) {
      var urunFiyati = iGetUrunDetailsInfoViewModel.urunDetailsResponse.data.data![0].sellingPriceVatIncluded;
      return Text(
        urunfiyati(urunFiyati),
        style: const TextStyle(
          fontSize: 15,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      return const Center(
        child: Text(
          "null",
          style: TextStyle(overflow: TextOverflow.ellipsis),
        ),
      );
    }
  }

  Widget nitelik1(IGetProductInfoViewModel iGetProductInfoViewModel) {
    if (iGetProductInfoViewModel.productFindResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetProductInfoViewModel.productFindResponse.status == Status.completed) {
      altUrunVarMi = iGetProductInfoViewModel.productFindResponse.data.data![0].hasVariant;
    }
    if (altUrunVarMi! == 1) {
      var nitelikIlk = iGetProductInfoViewModel.productFindResponse.data.data![0].variants;
      return Material(
        elevation: 1,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 10),
          height: 90,
          width: (MediaQuery.of(context).size.width - 10) / 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Renk",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(height: 10),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setState2) {
                            return AlertDialog(
                              alignment: Alignment.bottomCenter,
                              insetPadding: const EdgeInsets.all(0),
                              contentPadding: const EdgeInsets.all(0),
                              actions: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: 100,
                                      child: CachedNetworkImage(
                                        imageUrl: resimUrl,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 5, left: 5),
                                        alignment: Alignment.topLeft,
                                        height: 150,
                                        width: (MediaQuery.of(context).size.width),
                                        child: Column(
                                          children: [
                                            Text(
                                              urunAdi,
                                              style: const TextStyle(color: Colors.black45, fontSize: 15),
                                            ),
                                            Text(
                                              "$urunFiyat TL",
                                              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                  width: (MediaQuery.of(context).size.width),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: nitelikIlk?.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState2(() {
                                            secilenTypeId = nitelikIlk[index].typeId;
                                          });
                                          nitelik1Title = nitelikIlk[index].type;
                                          secilenindex = index;

                                          setState(() {});

                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 70,
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: nitelikIlk![index].typeId == secilenTypeId ? Colors.red : Colors.blue, width: 2),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(nitelikIlk[index].type),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(nitelik1Title!, style: const TextStyle(fontSize: 17)), const Icon(Icons.arrow_downward_sharp)],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget nitelik2(IGetProductInfoViewModel iGetProductInfoViewModel) {
    if (iGetProductInfoViewModel.productFindResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetProductInfoViewModel.productFindResponse.status == Status.completed) {
      nitelik2varMi = iGetProductInfoViewModel.productFindResponse.data.data![0].variants![secilenindex!].children![0].typeId;
    }
    if (nitelik2varMi! != "0") {
      var nitelikIki = iGetProductInfoViewModel.productFindResponse.data.data![0].variants![secilenindex!].children;
      return Material(
        elevation: 1,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 10),
          height: 90,
          width: (MediaQuery.of(context).size.width - 10) / 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Beden",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(height: 10),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, setState2) {
                            return AlertDialog(
                              alignment: Alignment.bottomCenter,
                              insetPadding: const EdgeInsets.all(0),
                              contentPadding: const EdgeInsets.all(0),
                              actions: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: 100,
                                      child: CachedNetworkImage(
                                        imageUrl: resimUrl,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 5, left: 5),
                                        alignment: Alignment.topLeft,
                                        height: 150,
                                        width: (MediaQuery.of(context).size.width),
                                        child: Column(
                                          children: [
                                            Text(
                                              urunAdi,
                                              style: const TextStyle(color: Colors.black45, fontSize: 15),
                                            ),
                                            Text(
                                              "$urunFiyat TL",
                                              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                  width: (MediaQuery.of(context).size.width),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: nitelikIki?.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState2(() {
                                            secilenTypeIdB = nitelikIki[index].variantId;
                                          });
                                          setState(() {});
                                          nitelik1TitleB = nitelikIki[index].type;
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 70,
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: nitelikIki![index].typeId == secilenTypeId ? Colors.red : Colors.blue, width: 2),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(nitelikIki[index].type),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(nitelik1TitleB!, style: const TextStyle(fontSize: 17)), const Icon(Icons.arrow_downward_sharp)],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget favoriListWidget(IGetFavoriInfoViewModel iGetFavoriInfoViewModel) {
    if (iGetFavoriInfoViewModel.favoriResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetFavoriInfoViewModel.favoriResponse.status == Status.completed) {
      var favorites = iGetFavoriInfoViewModel.favoriResponse.data.data;
      List favori = [];
      for (var i = 0; i < favorites.length; i++) {
        favori.add(favorites[i].id);
      }
      if (favori.contains(widget.urunId)) {
        favoriEkli = true;
        return const Icon(
          Icons.favorite,
          color: Colors.red,
        );
      } else {
        favoriEkli = false;
        return const Icon(
          Icons.favorite_border,
        );
      }
    } else {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.share),
              const SizedBox(
                width: 10,
              ),
              favoriListWidget(ref.read(iGetFavoriInfoViewModel)),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: detailPageWidget(ref.watch(iGetUrunDetailsInfoViewModel), ref.watch(iGetFavoriInfoViewModel), ref.watch(iAddFavoriInfoViewModel),
          ref.watch(iGetProductInfoViewModel)),
      floatingActionButton: Container(
        width: (MediaQuery.of(context).size.width - 30) / 1,
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Center(
                      child: urunFiyatiWidget(ref.watch(iGetUrunDetailsInfoViewModel)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("TL", style: TextStyle(overflow: TextOverflow.ellipsis)),
                  ],
                )),
            InkWell(
              onTap: () {
                if (int.parse(stok) <= 0) {
                  Fluttertoast.showToast(
                      msg: "Stokta yok",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {
                  addToCart(productCount: dropdownValueAdet, productId: widget.urunId, variantId: secilenTypeIdB).then((value) {
                    Fluttertoast.showToast(
                        msg: gelenMesaj(ref.watch(iGetAddToCartInfoViewModel)),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.pop(context);
                  });
                }
              },
              child: Container(
                width: (MediaQuery.of(context).size.height - 50) / 3,
                height: 70,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Sepete ekle",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getProdutDetails() {
    ref.read(iGetUrunDetailsInfoViewModel).getProductDetails(widget.urunId);
  }

  addFavorite() async {
    Constants().loading(context);
    await ref.watch(iAddFavoriInfoViewModel).addFavorite(widget.urunId);
  }

  getfavori() {
    ref.read(iGetFavoriInfoViewModel).getFavori();
  }

  getfavori1() {
    ref.watch(iGetFavoriInfoViewModel).getFavori();
  }

  deleteFavori() async {
    Constants().loading(context);
    await ref.watch(iGetDeleteFavoriInfoViewModel).deleteFavori(widget.urunId);
  }

  addToCart({productCount, productId, variantId}) async {
    Constants().loading(context);
    await ref.watch(iGetAddToCartInfoViewModel).addToCard(productCount, productId, variantId);
  }

  urunfiyati(String fiyat) {
    return fiyat;
  }

  getProduct() {
    ref.read(iGetProductInfoViewModel).getProductList(widget.urunId);
  }

  gelenMesaj(IGetAddToCartInfoViewModel iGetAddToCartInfoViewModel) {
    return iGetAddToCartInfoViewModel.addToCartResponse.data.message[0].text[0].toString();
  }
}
