import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:eticaret/ui/screens/homePage/account/account_page.dart';
import 'package:eticaret/ui/screens/homePage/categoriTree/categori_tree_page.dart';
import 'package:eticaret/ui/screens/homePage/home_page/home_page.dart';
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
    var box = Hive.box("CustomerLoginHive");
    customerId = box.get("customerId");
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

}
