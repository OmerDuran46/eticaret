import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:eticaret/main.dart';
import 'package:eticaret/ui/screens/homePage/product_list_page/search_product_list.dart';
import 'package:eticaret/ui/screens/urun_detay/urun_detay_page.dart';

import '../../../../core/api/api_response.dart';
import 'i_search_info_view_model.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  TextEditingController searchController = TextEditingController();
  var q = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductFindd();
    searchController;
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    ref.read(iGetSearchInfoViewModel).searchResponse.status = Status.loading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: searchWidget(ref.watch(iGetSearchInfoViewModel)),
    );
  }

  getProductFindd() {
    ref.read(iGetSearchInfoViewModel).getProductFind(q);
  }

  getProductFindf(qq) {
    ref.read(iGetSearchInfoViewModel).getProductFind(qq);
  }

  Widget searchWidget(IGetSearchInfoViewModel iGetSearchInfoViewModel) {
    if (iGetSearchInfoViewModel.searchResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetSearchInfoViewModel.searchResponse.status == Status.completed) {
      var getProductFind = iGetSearchInfoViewModel.searchResponse.data.data;
      if (searchController.text == "") {
        var box = Hive.box("SearchCache");
        var searchCache=box.values.toList();
        for(var i=0;i<searchCache.length/2;i++){
          var searchListSonuc = searchCache[i];
          searchCache[i] = searchCache[searchCache.length-1-i];
          searchCache[searchCache.length-1-i] = searchListSonuc;
        }
        return Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 20,
              height: 60,
              child: TextField(
                onSubmitted: (deger) {
                  if (searchController.text.isNotEmpty) {
                    var box = Hive.box("SearchCache");
                    box.add(searchController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchProductListPage(searchController.text)));
                  }
                },
                controller: searchController,
                autofocus: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  enabled: true,
                  suffixIcon: InkWell(onTap: () {
                    Navigator.pop(context);
                  },
                    child: const Icon(
                      Icons.cancel,
                      color: Colors.black54,
                    ),
                  ),
                  hintText: "Burada Ara",
                  hintStyle: const TextStyle(
                    fontSize: 13,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    getProductFindf(value);
                  } else {
                    const Text("Lütfen ürün ismi yazınız.");
                  }
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.chrome_reader_mode_outlined, size: 50),
                          Text(
                            "Barkod Tara",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.mic_none_rounded, size: 50),
                          Text(
                            "Sesli Arama",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 25),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Arama Geçmişi",
                          style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Text('Arama geçmişini istediğinize emin misiniz?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Hayır'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      box.clear();
                                      getProductFindd();
                                      Navigator.pop(context, 'Cancel');
                                    });
                                  },
                                  child: const Text('Evet'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 25),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Geçmişi Temizle",
                            style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                  // reverse: true,
                  itemCount: searchCache.length,
                  itemBuilder: (context, index) {

                    return Column(
                      children: [
                        ListTile(
                          leading: const SizedBox(width: 50, height: 150, child: Icon(Icons.image)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchProductListPage(box.get(index)),
                                      ),
                                    );
                                  },
                                  child: Text(searchCache[index])),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                          color: Colors.grey.shade400,
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        );
      } else {
        return Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 20,
              height: 60,
              child: TextField(
                onSubmitted: (deger) {
                  if (searchController.text.isNotEmpty) {
                    var box = Hive.box("SearchCache");
                    box.add(searchController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchProductListPage(searchController.text)));
                  }
                },
                controller: searchController,
                autofocus: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  enabled: true,
                  suffixIcon: InkWell(onTap: () {
                    Navigator.pop(context);
                  },
                    child: const Icon(
                      Icons.cancel,
                      color: Colors.black54,
                    ),
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
                    borderSide: BorderSide(color: Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    getProductFindf(value);
                  } else {
                    const Text("Lütfen ürün ismi yazınız.");
                  }
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.chrome_reader_mode_outlined, size: 50),
                          Text(
                            "Barkod Tara",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.mic_none_rounded, size: 50),
                          Text(
                            "Sesli Arama",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 25),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "İlgili Ürünler",
                      style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                  itemCount: getProductFind?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UrunDetayPage(urunId: getProductFind[index].id),));
                        },
                          child: ListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 150,
                              child: Image(
                                image: CachedNetworkImageProvider(getProductFind![index].image!.medium),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(getProductFind[index].title),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  "Ürün",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                          color: Colors.grey.shade400,
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        );
      }
    } else {
      return const Center(child: Text("Favori ürünü gelirken hata oluştu"));
    }
  }
}
