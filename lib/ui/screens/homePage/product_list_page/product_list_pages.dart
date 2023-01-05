import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/api/api_response.dart';
import '../../../../main.dart';
import '../../urun_detay/urun_detay_page.dart';
import 'i_product_list_info_view_model.dart';

class ProductListPage extends ConsumerStatefulWidget {
  final String categoriId;
  const ProductListPage(this.categoriId, {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: productListWidget(ref.watch(iGetProductListInfoViewModel)),
    );
  }
  getProductFindCategori() {
    ref.read(iGetProductListInfoViewModel).getProductFindCategori(widget.categoriId);
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
