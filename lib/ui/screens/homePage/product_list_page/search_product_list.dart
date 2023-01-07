import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eticaret/ui/screens/homePage/search/i_search_info_view_model.dart';

import '../../../../core/api/api_response.dart';
import '../../../../main.dart';
import '../../urun_detay/urun_detay_page.dart';
import '../search/search_page.dart';

class SearchProductListPage extends ConsumerStatefulWidget {
  final String q;

  const SearchProductListPage(
    this.q, {
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SearchProductListPageState();
}

class _SearchProductListPageState extends ConsumerState<SearchProductListPage> {
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    ref.read(iGetSearchInfoViewModel).searchResponse.status = Status.loading;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getProductFindd();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            child: Row(
              children: [
                InkWell(onTap: () {
                  Navigator.pop(context);
                },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.pink,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 60,
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
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
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: searchProductListWidget(ref.watch(iGetSearchInfoViewModel)),
    );
  }

  getProductFindd() {
    ref.read(iGetSearchInfoViewModel).getProductFind(widget.q);
  }

  Widget searchProductListWidget(IGetSearchInfoViewModel iGetSearchInfoViewModel) {
    if (iGetSearchInfoViewModel.searchResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetSearchInfoViewModel.searchResponse.status == Status.completed) {
      var getProductFind = iGetSearchInfoViewModel.searchResponse.data.data;

      return Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverGrid(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      mainAxisExtent: 300,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        var productId = getProductFind[index].id;
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
                                        image: CachedNetworkImageProvider(getProductFind[index].image!.medium),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              getProductFind[index].title,
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
                                                ("${double.parse((getProductFind[index].priceSell ?? (getProductFind[index].priceSell = 0)).toStringAsFixed(2))}  TL"),
                                                style: const TextStyle(overflow: TextOverflow.ellipsis, color: Colors.red, fontWeight: FontWeight.bold),
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
                      childCount: getProductFind!.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return const Center(child: Text("Hata oluştu"));
    }
  }
}
