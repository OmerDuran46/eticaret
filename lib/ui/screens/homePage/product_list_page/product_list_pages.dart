import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/api/api_response.dart';
import '../../../../main.dart';
import '../../urun_detay/urun_detay_page.dart';
import '../search/search_page.dart';
import 'i_product_list_info_view_model.dart';

class ProductListPage extends ConsumerStatefulWidget {
  final String categoriId;

  const ProductListPage(
    this.categoriId, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductFindCategori();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    ref.read(iGetProductListInfoViewModel).productListResponse.status = Status.loading;
  }
  String? secilenSiralama = "0";
  bool gridSize=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.pink,
            )),
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  disabledBorder:
                      OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  enabled: false,
                  suffixIcon: const Icon(
                    Icons.mic_none_outlined,
                    color: Colors.black87,
                  ),
                  hintText: "Burada Ara",
                  hintStyle: const TextStyle(
                    fontSize: 13,
                  ),
                  prefixIcon: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.black87,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: productListWidget(ref.watch(iGetProductListInfoViewModel)),
    );
  }

  getProductFindCategori() {
    ref.read(iGetProductListInfoViewModel).getProductFindCategori(widget.categoriId,secilenSiralama);
  }

  Widget productListWidget(IGetProductListInfoViewModel iGetProductListInfoViewModel) {
    if (iGetProductListInfoViewModel.productListResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetProductListInfoViewModel.productListResponse.status == Status.completed) {
      var getProductFind = iGetProductListInfoViewModel.productListResponse.data;

      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.shade200,
              ),
              height: 40,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                InkWell(onTap: () {
                  setState(() {
                   gridSize = gridSize == false?true:false;
                  });

                },child: const Icon(Icons.splitscreen)),
                const Text("|"),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState1) {
                          return AlertDialog(
                            actions: [
                              Column(
                                children: [
                                  RadioListTile(
                                      title: const Text("Varsayılan Sıralama"),
                                      value: "0",
                                      groupValue: secilenSiralama,
                                      onChanged: (value) {
                                        setState(() {
                                          secilenSiralama = value;
                                          getProductFindCategori();
                                          Navigator.pop(context);
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("Alfabetik A-Z"),
                                      value: "1",
                                      groupValue: secilenSiralama,
                                      onChanged: (value) {
                                        setState(() {
                                          secilenSiralama = value;
                                          getProductFindCategori();
                                          Navigator.pop(context);
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("Alfabetik Z-A"),
                                      value: "2",
                                      groupValue: secilenSiralama,
                                      onChanged: (value) {
                                        setState(() {
                                          secilenSiralama = value;
                                          getProductFindCategori();
                                          Navigator.pop(context);
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("Yeniden Eskiye"),
                                      value: "3",
                                      groupValue: secilenSiralama,
                                      onChanged: (value) {
                                        setState(() {
                                          secilenSiralama = value;
                                          getProductFindCategori();
                                          Navigator.pop(context);
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("Eskiden Yeniye"),
                                      value: "4",
                                      groupValue: secilenSiralama,
                                      onChanged: (value) {
                                        setState(() {
                                          secilenSiralama = value;
                                          getProductFindCategori();
                                          Navigator.pop(context);
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("Fiyat Artan"),
                                      value: "5",
                                      groupValue: secilenSiralama,
                                      onChanged: (value) {
                                        setState(() {
                                          secilenSiralama = value;
                                          getProductFindCategori();
                                          Navigator.pop(context);
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("Fiyat Azalan"),
                                      value: "6",
                                      groupValue: secilenSiralama,
                                      onChanged: (value) {
                                        setState(() {
                                          secilenSiralama = value;
                                          getProductFindCategori();
                                          Navigator.pop(context);
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("Rastlege"),
                                      value: "7",
                                      groupValue: secilenSiralama,
                                      onChanged: (value) {
                                        setState(() {
                                          secilenSiralama = value;
                                          getProductFindCategori();
                                          Navigator.pop(context);
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("Puana Göre"),
                                      value: "8",
                                      groupValue: secilenSiralama,
                                      onChanged: (value) {
                                        setState(() {
                                          secilenSiralama = value;
                                          getProductFindCategori();
                                          Navigator.pop(context);
                                        });
                                      }),
                                ],
                              )
                            ],
                          );
                        });
                      },
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.swap_horiz_sharp),
                      Text("Sırala"),
                    ],
                  ),
                ),
                const Text("|"),
                Row(
                  children: const [
                    Icon(Icons.filter_alt_outlined),
                    Text("Filtrele"),
                  ],
                ),
              ]),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverGrid(
                    gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: gridSize==true?250:500,
                      mainAxisExtent: 300,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        var productId = getProductFind.data[index].id;
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UrunDetayPage(urunId: productId.toString()),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                            ),
                            child: Material(
                              elevation: 5,
                              child: Center(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      height: 200,
                                      child: Image(
                                        image: CachedNetworkImageProvider(getProductFind.data[index].image.medium),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              getProductFind.data[index].title,
                                              style: const TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black54),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                ("${double.parse((getProductFind.data[index].priceSell ?? (getProductFind.data[index].priceSell = 0)).toStringAsFixed(2))}  TL"),
                                                style:
                                                    const TextStyle(overflow: TextOverflow.ellipsis, color: Colors.red, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: getProductFind.data.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return const Center(child: Text("Hata oluştu!"));
    }
  }
}
