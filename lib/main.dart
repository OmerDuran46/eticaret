import 'package:eticaret/ui/screens/homePage/account/price_alarm/delete_alarm/i_delete_alarm_info_View_Model.dart';
import 'package:eticaret/ui/screens/homePage/account/price_alarm/delete_alarm/i_deletealarm_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/account/price_alarm/get_price_alarm_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/account/price_alarm/i_get_price_alarm_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/account/stock_alarm/get_stock_alarm_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/account/stock_alarm/i_get_stock_alarm_info_viewmodel.dart';
import 'package:eticaret/ui/screens/member_registration/i_member_registration_info_view_model.dart';
import 'package:eticaret/ui/screens/member_registration/member_registration_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:eticaret/locator.dart';
import 'package:eticaret/ui/screens/add_favorite/add_favori_info_viewmodel.dart';
import 'package:eticaret/ui/screens/add_favorite/i_add_favori_info_view_model.dart';
import 'package:eticaret/ui/screens/get_favori_pages/get_favori_info_viewmodel.dart';
import 'package:eticaret/ui/screens/get_favori_pages/i_get_favori_info_view_model.dart';
import 'package:eticaret/ui/screens/get_product_list/get_product_info_viewmodel.dart';
import 'package:eticaret/ui/screens/get_product_list/i_get_product_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/account/account__setting_pages/i_update_customer_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/account/account__setting_pages/update_customer_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/account/adress_page/delete_address/delete_address_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/account/adress_page/delete_address/i_delete_address_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/account/adress_page/get_address_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/account/adress_page/i_get_address_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/addToCart/i_search_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/addToCart/search_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/categoriTree/get_categori_tree_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/categoriTree/i_get_categori_tree_view_model.dart';
import 'package:eticaret/ui/screens/homePage/delete_favori/delete_faovri_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/delete_favori/i_delete_favori_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/get_customer/get_product_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/get_customer/i_get_product_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/get_home_page_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/i_get_home_page_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/product_list_page/i_product_list_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/product_list_page/product_list_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/search/search_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/search/i_search_info_view_model.dart';
import 'package:eticaret/ui/screens/homePage/sepet_page/get_cart_info_viewmodel.dart';
import 'package:eticaret/ui/screens/homePage/sepet_page/i_get_cart_info_view_model.dart';
import 'package:eticaret/ui/screens/login/get_log_info_view_model.dart';
import 'package:eticaret/ui/screens/login/i_get_log_info_view_model.dart';
import 'package:eticaret/ui/splash/splash.dart';
import 'package:eticaret/ui/screens/urun_detay/add_alarm/add_alarm_info_viewmodel.dart';
import 'package:eticaret/ui/screens/urun_detay/add_alarm/i_add_alarm_info_view_model.dart';
import 'package:eticaret/ui/screens/urun_detay/getAciklamaPage/get_urun_aciklama_page_info_viewmodel.dart';
import 'package:eticaret/ui/screens/urun_detay/getAciklamaPage/i_get_urun_aciklama_page_info_view_model.dart';
import 'package:eticaret/ui/screens/urun_detay/get_urun_details_page_info_viewmodel.dart';
import 'package:eticaret/ui/screens/urun_detay/i_get_urun_details_page_info_view_model.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('CustomerLoginHive');
  await Hive.openBox('ApplicationToken');
  await Hive.openBox('SearchCache');
  await Hive.openBox('FavoriteNitelik1');
  await Hive.openBox('FavoriteNitelik2');

  setupLocator();
  runApp(const ProviderScope(child: MyApp()));
}


final iGetProductInfoViewModel=ChangeNotifierProvider<IGetProductInfoViewModel>((ref) => getProductInfoViewModel());
final iGetFavoriInfoViewModel=ChangeNotifierProvider<IGetFavoriInfoViewModel>((ref) => getFavoriInfoViewModel());
final iGetIndexInfoViewModel=ChangeNotifierProvider<IGetIndexInfoViewModel>((ref) => getIndexInfoViewModel());
final iGetCategoriTreeInfoViewModel=ChangeNotifierProvider<IGetCategoriTreeInfoViewModel>((ref) => getCategoriTreeInfoViewModel());
final iGetSearchInfoViewModel=ChangeNotifierProvider<IGetSearchInfoViewModel>((ref) => getSearchInfoViewModel());
final iGetAddToCartInfoViewModel=ChangeNotifierProvider<IGetAddToCartInfoViewModel>((ref) => getAddToCartInfoViewModel());
final iGetCustomerInfoViewModel=ChangeNotifierProvider<IGetCustomerInfoViewModel>((ref) => getCustomerInfoViewModel());
final iGetUrunDetailsInfoViewModel=ChangeNotifierProvider<IGetUrunDetailsInfoViewModel>((ref) => getUrunDetailsInfoViewModel());
final iGetUrunAciklamaInfoViewModel=ChangeNotifierProvider<IGetUrunAciklamaInfoViewModel>((ref) => getUrunAciklamaInfoViewModel());
final iGetCartInfoViewModel=ChangeNotifierProvider<IGetCartInfoViewModel>((ref) => getCartInfoViewModel());
final iAddFavoriInfoViewModel=ChangeNotifierProvider<IAddFavoriInfoViewModel>((ref) => addFavoriInfoViewModel());
final iGetDeleteFavoriInfoViewModel=ChangeNotifierProvider<IGetDeleteFavoriInfoViewModel>((ref) => getDeleteFavoriInfoViewModel());
final iAddAlarmInfoViewModel=ChangeNotifierProvider<IAddAlarmInfoViewModel>((ref) => addAlarmInfoViewModel());
final iGetAddressInfoViewModel=ChangeNotifierProvider<IGetAddressInfoViewModel>((ref) => getAddressInfoViewModel());
final iGetDeleteAddressInfoViewModel=ChangeNotifierProvider<IGetDeleteAddressInfoViewModel>((ref) => getDeleteAddressInfoViewModel());
final iGetUpdateCustomerInfoViewModel=ChangeNotifierProvider<IGetUpdateCustomerInfoViewModel>((ref) => getUpdateCustomerInfoViewModel());
final iGetCustomerLoginInfoViewModel=ChangeNotifierProvider<IGetCusomerLoginViewModel>((ref) => getCusomerLoginViewModel());
final iGetApplicationLoginInfoViewModel=ChangeNotifierProvider<IGetApplicationLoginViewModel>((ref) => getApplicationLoginViewModel());
final iGetProductListInfoViewModel=ChangeNotifierProvider<IGetProductListInfoViewModel>((ref) => getProductListInfoViewModel());
final iDeleteCartItemInfoViewModel=ChangeNotifierProvider<IDeleteCartItemInfoViewModel>((ref) => deleteCartItemInfoViewModel());
final iGetPriceAlarmInfoViewModel=ChangeNotifierProvider<IGetPriceAlarmInfoViewModel>((ref) => getPriceAlarmInfoViewModel());
final iGetStockAlarmInfoViewModel=ChangeNotifierProvider<IGetStockAlarmInfoViewModel>((ref) => getStockAlarmInfoViewModel());
final iDeleteAlarmInfoViewModel=ChangeNotifierProvider<IDeleteAlarmInfoViewModel>((ref) => deleteAlarmInfoViewModel());
final iCreateCustomerInfoViewModel=ChangeNotifierProvider<ICreateCustomerInfoViewModel>((ref) => createCustomerInfoViewModel());
final iCustomerLoginWebInfoViewModel=ChangeNotifierProvider<ICustomerLoginWebInfoViewModel>((ref) => customerLoginWebInfoViewModel());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
          primarySwatch: Colors.pink,
      ),debugShowCheckedModeBanner: false,
      home:  const SplashPage(),
    );
  }
}
