import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:eticaret/ui/screens/homePage/account/account_page.dart';
import 'package:eticaret/ui/screens/homePage/categoriTree/categori_tree_page.dart';
import 'package:eticaret/ui/screens/homePage/home_page/home_page.dart';
import 'package:eticaret/ui/screens/homePage/sepet_page/i_get_cart_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/sepet_page/getWidget.dart';
import '../../../core/api/api_response.dart';
import '../../../main.dart';
import '../get_favori_pages/get_favori_list_pages.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  PageController pageController = PageController();
  String? customerId;

  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomer();

    getfavori();
    getCustomer();

    var box = Hive.box("CustomerLoginHive");
    customerId = box.get("customerId");
    debugPrint(customerId);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    ref.read(iGetIndexInfoViewModel).indexResponse.status = Status.loading;
    ref.read(iGetFavoriInfoViewModel).favoriResponse.status = Status.loading;
    ref.read(iGetAddToCartInfoViewModel).addToCartResponse.status = Status.loading;
    ref.read(iGetCustomerInfoViewModel).getcustomerResponse.status = Status.loading;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget getCartWidget(IGetCartInfoViewModel iGetCartInfoViewModel) {
    if (iGetCartInfoViewModel.getCartResponse.status == Status.loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (iGetCartInfoViewModel.getCartResponse.status == Status.completed) {
      var product = iGetCartInfoViewModel.getCartResponse.data.data!.products;

      return Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(5),
        height: 500,
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
                                "${product[index].priceSell} TL",
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
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.delete),
                            Icon(Icons.delete),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          const HomePages(),
          const CategoriTreePage(),
          const GetFavoriInfoPage(),
          CartPage(customerId == null ? "30" : customerId.toString()),
          const AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: "Kategoriler"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favoriler"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined), label: "Sepet"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Hesabım"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }

  applicationLogin() {
    ref.read(iGetIndexInfoViewModel).getIndex();
  }

  getfavori() {
    ref.read(iGetFavoriInfoViewModel).getFavori();
  }

  getCustomer() {
    ref.read(iGetCustomerInfoViewModel).getCustomer();
  }
}
