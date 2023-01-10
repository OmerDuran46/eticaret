import 'package:cached_network_image/cached_network_image.dart';
import 'package:eticaret/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eticaret/main.dart';
import 'package:eticaret/ui/screens/homePage/product_list_page/product_list_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/api/api_response.dart';
import '../homePage/account/login_control_page/login_control_pages.dart';
import '../homePage/addToCart/i_search_info_view_model.dart';
import '../homePage/get_customer/i_get_product_info_view_model.dart';
import 'i_get_favori_info_view_model.dart';

class GetFavoriInfoPage extends ConsumerStatefulWidget {
  const GetFavoriInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _GetFavoriInfoPageState();
}

class _GetFavoriInfoPageState extends ConsumerState<GetFavoriInfoPage> {
  Widget favoriWidget(IGetFavoriInfoViewModel iGetFavoriInfoViewModel, IGetCustomerInfoViewModel iGetCustomerInfoViewModel) {
    if (iGetFavoriInfoViewModel.favoriResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetFavoriInfoViewModel.favoriResponse.status == Status.completed) {
      if(loginControl=="false"){
      return const LoginControlPage();
      }else{
        var favoriList = iGetFavoriInfoViewModel.favoriResponse.data;
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
            itemCount: favoriList.data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                child: Material(
                  elevation: 10,
                  shadowColor: Colors.grey,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
                    width: double.infinity,
                    height: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 90,
                          height: 150,
                          child: Ink.image(
                            image: CachedNetworkImageProvider(favoriList.data[index].image.medium),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          height: 1,width: 1,color: Colors.red,
                        ),
                        Expanded(
                          child: SizedBox(

                            width: (MediaQuery.of(context).size.width+70) /2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        favoriList.data[index].title,
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey.shade700, overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    Container(
                                      height: 25,
                                      alignment: Alignment.topRight,
                                      child: PopupMenuButton(
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            PopupMenuItem(
                                                child: InkWell(onTap:() {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage(favoriList.data[index].categoryId),));
                                                } ,
                                                  child: Row(
                                                    children:  const [
                                                      Icon(Icons.remove_red_eye_outlined),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("Benzer Ürünleri Gör")
                                                    ],
                                                  ),
                                                )),
                                            PopupMenuItem(
                                              child: InkWell(onTap: () {
                                                deleteFavori(favoriList.data[index].id).then((value){
                                                  getfavoriYeni();
                                                  Navigator.pop(context);
                                                });
                                              },
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:  const [
                                                    Icon(
                                                      Icons.delete,
                                                      color: Colors.black87,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Sil ",
                                                      style: TextStyle(color: Colors.black87),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ];
                                        },
                                        child: const Icon(Icons.more_vert),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.star, color: Colors.red, size: 20),
                                    Icon(Icons.star, color: Colors.red, size: 20),
                                    Icon(Icons.star, color: Colors.red, size: 20),
                                    Icon(Icons.star, color: Colors.red, size: 20),
                                    Icon(Icons.star, color: Colors.red, size: 20),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  ("${double.parse((favoriList.data[index].priceSell*(1+18/100)).toStringAsFixed(2))}  TL"),
                                  style: const TextStyle(overflow: TextOverflow.ellipsis, color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                nitelik1(
                                  favoriList.data[index].hasVariant,
                                  favoriList.data[index].imageList[0].small,
                                  favoriList.data[index].title,
                                  favoriList.data[index].priceSell,
                                  favoriList.data[index].variants,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    nitelik2(
                                      favoriList.data[index].hasVariant,
                                      favoriList.data[index].imageList[0].small,
                                      favoriList.data[index].variants?[secilenindex].children[0].typeId,
                                      favoriList.data[index].title,
                                      favoriList.data[index].priceSell,
                                      favoriList.data[index].variants?[secilenindex].children,
                                    ),
                                    const SizedBox(width: 5,),
                                    ElevatedButton(onPressed: () {
                                      addToCart(productCount: "1",productId:favoriList.data[index].id,variantId: variantId).then((value){
                                        Fluttertoast.showToast(
                                            msg: gelenMesaj(ref.watch(iGetAddToCartInfoViewModel)),
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        variantId="";
                                        Navigator.pop(context);
                                      });
                                    }, child: const Text("Sepete Ekle"))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );

      }


    } else {
      return const Center(
        child: Text("Favori ürünü gelirken hata oluştu"),
      );
    }
  }

  bool favoriEkli = false;
  int? altUrunVarMi = 0;
  String? nitelik2varMi = "0";
  late String uyeId;
  late dynamic stok;
  String? gender;
  String? secilenTypeId = "0";
  String? secilenTypeIdB = "0";
  String? nitelik1TitleB = "Seçiniz..";
  var secilenindex = 0;
  var variant2index = 0;
  String variantId="";
  String loginControl="false";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfavori();
    getCustomer();
     loginControl=Constants.parolaGetir();
  }
  gelenMesaj(IGetAddToCartInfoViewModel iGetAddToCartInfoViewModel) {
    return  iGetAddToCartInfoViewModel.addToCartResponse.data.message[0].text[0].toString();
  }
  getCustomer() {
    ref.read(iGetCustomerInfoViewModel).getCustomer();
  }
  deleteFavori(id) async {
    await ref.watch(iGetDeleteFavoriInfoViewModel).deleteFavori(id);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Favorilerim",
          style: TextStyle(color: Colors.pink),
        ),
        centerTitle: true,
      ),
      body: favoriWidget(ref.watch(iGetFavoriInfoViewModel), ref.watch(iGetCustomerInfoViewModel)),
    );
  }
  addToCart({productCount, productId, variantId}) async {
    Constants().loading(context);
    await ref.watch(iGetAddToCartInfoViewModel).addToCard(productCount, productId, variantId);

  }
  getfavori() {
    ref.read(iGetFavoriInfoViewModel).getFavori();
  }
  getfavoriYeni() {
    ref.watch(iGetFavoriInfoViewModel).getFavori();
  }

  StatefulBuilder nitelik1(altUrunVarMi, resimUrl, urunAdi, urunFiyat, nitelikIlk) {
    if (altUrunVarMi! == 1) {
      return StatefulBuilder(
        builder: (context, setState) => Container(
          height: 40,
          width: (MediaQuery.of(context).size.width - 40)/3,
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
                              itemCount: nitelikIlk.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      nitelikIlk[index].selectedOne = nitelikIlk[index].type;
                                      secilenTypeId = nitelikIlk![index].typeId;
                                      variantId = nitelikIlk![index].variantId;

                                      secilenindex = index;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 70,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: nitelikIlk![index].typeId == secilenTypeId ? Colors.red : Colors.blue, width: 2),
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
              children: [

                Expanded(child: Text(nitelikIlk[secilenindex].selectedOne, style: const TextStyle(fontSize: 17),overflow: TextOverflow.ellipsis)),
                const Icon(Icons.arrow_drop_down_sharp),
              ],
            ),
          ),
        ),
      );
    } else {
      return StatefulBuilder(
        builder: (context, setState) {
          return const SizedBox();
        },
      );
    }
  }

  StatefulBuilder nitelik2(nitelik1varmi, resimUrl, nitelik2varMi, urunAdi, urunFiyat, nitelikIki) {
    if (nitelik2varMi == "0" || nitelik2varMi == null && nitelik1varmi == 0) {
      return StatefulBuilder(
        builder: (context, setState) {
          return const SizedBox();
        },
      );
    } else {

      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: 40,
            width: (MediaQuery.of(context).size.width - 60)/3,

            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState3) {
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
                                       variant2index= index;
                                       variantId = nitelikIki?[index].variantId;
                                      nitelik1TitleB = nitelikIki?[index].type;
                                      secilenTypeIdB = nitelikIki?[index].typeId;
                                      nitelikIki?[index].selectedTwo=nitelikIki?[index].type;
                                      setState(() {
                                      });

                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 70,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: nitelikIki?[index].typeId == secilenTypeId ? Colors.red : Colors.blue, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(nitelikIki![index].type),
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
                children: [

                  Text(nitelikIki?[variant2index].selectedTwo, style: const TextStyle(fontSize: 17),),
                  const Icon(Icons.arrow_drop_down_sharp),
                ],
              )


            ),
          );
        },
      );
    }
  }


}
