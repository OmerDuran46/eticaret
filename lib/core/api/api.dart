import 'dart:convert';
import 'dart:io' show Platform;

import 'package:eticaret/core/models/create_customer_model.dart';
import 'package:eticaret/core/models/delete_alarm_model.dart';
import 'package:eticaret/core/models/get_price_alarm_model.dart';
import 'package:eticaret/core/models/get_stock_alarm_model.dart';
import 'package:http/http.dart' as http;
import 'package:eticaret/core/models/add_favori_model.dart';
import 'package:eticaret/core/models/applicationLogin.dart';
import 'package:eticaret/core/models/categori_tree_model.dart';
import 'package:eticaret/core/models/delete_favori_model.dart';
import 'package:eticaret/core/models/favori_model.dart';
import 'package:eticaret/core/models/get_cart_model.dart';
import 'package:eticaret/core/models/get_product_comment_model.dart';
import 'package:eticaret/core/models/get_product_find_model.dart';
import 'package:eticaret/core/models/home_model.dart';
import 'package:eticaret/core/models/login_model.dart';
import 'package:eticaret/core/models/price_alarm_model.dart';
import 'package:eticaret/core/models/product_list_model.dart';
import 'package:eticaret/core/models/urun_details_model.dart';
import '../../locator.dart';
import '../constants/constants.dart';
import '../constants/endpoint.dart';
import '../models/addToCart_model.dart';
import '../models/customer_login_web_model.dart';
import '../models/delete_cart_item_model.dart';
import '../models/get_customer_model.dart';
import '../models/search_model.dart';
import '../models/yapilacak/delete_adress_model.dart';
import '../models/yapilacak/get_adress_model.dart';
import '../models/yapilacak/set_customer_model.dart';
import 'api_base_helper.dart';

class Api {
  static final ApiBaseHelper _apiBaseHelper = locator<ApiBaseHelper>();
  var client = http.Client();

  Future<ApplicationModel> applicationLogin() async {
    var url = "${Constants.tDomain}${Endpoints.applicationLogin}omer";
    Map<String, dynamic> body = {
      "pass": "Omer.456+",
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return ApplicationModel.fromJson(response);
  }

  Future<LoginModel> customerLogin(eposta, sifre) async {
    var url = Constants.tDomain + Endpoints.customerLogin;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "email": eposta,
      "password": sifre,
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return LoginModel.fromJson(response);
  }

  Future<ProductFindModel> getProduct({required urunId}) async {
    // ignore: prefer_interpolation_to_compose_strings
    var url = "${Constants.tDomain}${Endpoints.getFind}/" + urunId;
    Map<String, dynamic> body = {"token": Constants.applicationTokenGet(), "with_passive_sub_products": "true"};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return ProductFindModel.fromJson(response);
  }

  Future<FavoriModel> getFavori() async {
    var url = Constants.tDomain + Endpoints.getFavori;
    Map<String, dynamic> body = {"token": Constants.applicationTokenGet(), "MobileToken": Constants.parolaGetir()};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return FavoriModel.fromJson(response);
  }

  Future<DeleteFavoriModel> deleteFavori({required String id}) async {
    var url = Constants.tDomain + Endpoints.deleteFavori;
    Map<String, dynamic> body = {"token": Constants.applicationTokenGet(), "MobileToken": Constants.parolaGetir(), "ProductId": id};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return DeleteFavoriModel.fromJson(response);
  }

  Future<HomeModel> getIndex() async {
    var url = Constants.tDomain + Endpoints.getIndex;
    Map<String, dynamic> body = {"token": Constants.applicationTokenGet(), "new": "true"};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return HomeModel.fromJson(response);
  }

  Future<CategoriTreeModel> getCategoriTree() async {
    var url = Constants.tDomain + Endpoints.getCategoriTree;
    Map<String, dynamic> body = {"token": Constants.tKey};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return CategoriTreeModel.fromJson(response);
  }

  Future<SearchModel> getProductFind({required q}) async {
    var url = Constants.tDomain + Endpoints.getFind;
    Map<String, dynamic> body = {"token": Constants.applicationTokenGet(), "q": q};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return SearchModel.fromJson(response);
  }

  Future<ProductListModel> getProductFindCategori({required categoriId,required dynamic short}) async {
    var url = Constants.tDomain + Endpoints.getFind;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "category": categoriId,
      "sort": short,
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return ProductListModel.fromJson(response);
  }

  Future<AddToCartModel> addToCard({required productCount, required productId, required variantId}) async {
    var url = Constants.tDomain + Endpoints.addToCart;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "new": "true",
      "data": jsonEncode([
        {"customer_id": Constants.getCustomerId(), "cart_index": "-1", "product_id": productId, "variant_id": variantId ?? "", "count": productCount}
      ])
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return AddToCartModel.fromJson(response);
  }

  Future<GetCustomerModel> getCustomer() async {
    var url = Constants.tDomain + Endpoints.getCustomer;
    Map<String, dynamic> body = {"token": Constants.applicationTokenGet(), "MobileToken": Constants.parolaGetir()};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return GetCustomerModel.fromJson(response);
  }

  Future<UrunDetailsModel> getProductDetails({required String urunId}) async {
    var url = Constants.tDomain + Endpoints.getProductDetails;
    Map<String, dynamic> body = {"token": Constants.applicationTokenGet(), "ProductId": urunId, "FetchDetails": "true", "FetchSubProducts": "true"};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return UrunDetailsModel.fromJson(response);
  }

  Future<GetCommentModel> getComment({required String urunId}) async {
    var url = Constants.tDomain + Endpoints.getComments;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "f": "ProductId|$urunId|equal",
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return GetCommentModel.fromJson(response);
  }

  Future<AddFavoriModel> addFavorite({required String urunId}) async {
    var url = Constants.tDomain + Endpoints.addFavorite;
    Map<String, dynamic> body = {"token": Constants.tKey, "MobileToken": Constants.parolaGetir(), "ProductId": urunId};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return AddFavoriModel.fromJson(response);
  }

  Future<GetCartModel> getCart(customerId) async {
    var url = "${Constants.tDomain}${Endpoints.getCart}$customerId";
    Map<String, dynamic> body = {"token": Constants.applicationTokenGet(), "new": "true", "fetch_installment_list": "true"};
    var response = await _apiBaseHelper.post(url: url, body: body);

    return GetCartModel.fromJson(response);
  }

  Future<GetAdressModel> getAddress() async {
    var url = Constants.tDomain + Endpoints.getAddress;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "MobileToken": Constants.parolaGetir(),
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return GetAdressModel.fromJson(response);
  }

  Future<PriceAlarmModel> addPriceAlarm({required productId, alarmDay, productPrice, alarmPrice}) async {
    var url = Constants.tDomain + Endpoints.addAlarm;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "MobileToken": Constants.parolaGetir(),
      "ProductId": productId,
      "AlarmType": "Price",
      "AlarmDay": alarmDay,
      "CurrentPrice": productPrice,
      "AlarmPrice": alarmPrice,
      "Currency": "TL",
      "VatIncluded": "1",
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return PriceAlarmModel.fromJson(response);
  }

  Future<DeleteAdressModel> deleteAddress(addressId) async {
    var url = Constants.tDomain + Endpoints.deleteAddress + addressId;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "MobileToken": Constants.parolaGetir(),
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return DeleteAdressModel.fromJson(response);
  }

  Future<UpdateCustomerModel> updateCustomer(name, surname, email, phone, mobile, address, postcode) async {
    var url = Constants.tDomain + Endpoints.updateCustomer;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "MobileToken": Constants.parolaGetir(),
      "data":
          jsonEncode({"Name": name, "Surname": surname, "Email": email, "Phone": phone, "Mobile": mobile, "Address": address, "Postcode": postcode})
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return UpdateCustomerModel.fromJson(response);
  }

  Future<DeleteCartItemModel> deleteCartItem(productId, variantId) async {
    var url = Constants.tDomain + Endpoints.deleteCartIndex;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "new": "false",
      "data": jsonEncode([
        {"customer_id": Constants.getCustomerId(), "cart_index": "-1", "product_id": productId, "variant_id": variantId}
      ])
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return DeleteCartItemModel.fromJson(response);
  }

  Future<GetPriceAlarmModel> getPriceAlarm() async {
    var url = Constants.tDomain + Endpoints.getPriceAlarm;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "MobileToken": Constants.parolaGetir(),
      "AlarmType": "Price",
      "FetchProductData": "true",
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return GetPriceAlarmModel.fromJson(response);
  }

  Future<StockAlarmModel> getStockAlarm() async {
    var url = Constants.tDomain + Endpoints.getPriceAlarm;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "MobileToken": Constants.parolaGetir(),
      "AlarmType": "Stock",
      "FetchProductData": "true",
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return StockAlarmModel.fromJson(response);
  }

  Future<DeleteAlarmModel> deleteAlarm(alarmId) async {
    var url = Constants.tDomain + Endpoints.deleteAlarm + alarmId;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "MobileToken": Constants.parolaGetir(),
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return DeleteAlarmModel.fromJson(response);
  }

  Future<CreateCustomerModel> createCustomer(
      name, surname, email, password, phone, isEmailNotificationOn, isSmsNotificationOn, isPhoneCallNotificationOn) async {
    var url = Constants.tDomain + Endpoints.createCustomer;
    Map<String, dynamic> body = {
      "token": Constants.applicationTokenGet(),
      "data": jsonEncode([
        {
          "CustomerGroupCode": "TZ0",
          "Name": name,
          "Surname": surname,
          "Email": email,
          "Password": password,
          "Phone": phone,
          "IsEmailNotificationOn": isEmailNotificationOn,
          "IsSmsNotificationOn": isSmsNotificationOn,
          "IsPhoneCallNotificationOn": isPhoneCallNotificationOn,
        }
      ])
    };
    var response = await _apiBaseHelper.post(url: url, body: body);

    return CreateCustomerModel.fromJson(response);
  }

  Future<CustomerLoginWebModel> customerLoginWeb() async {
    var url = Constants.tDomain + Endpoints.customerLoginWeb;

    Map<String, dynamic> body = {
      "token": Constants.tKey,
      "customerId": Constants.getCustomerId(),
      "MobileToken": Constants.customerKey,
      "currency": "TL",
      "language": "tr",
      "loginRedirectUrl": Platform.isIOS
          ? "order?isFromiOSApp=true&returnParameter=TSoftShopperURLScheme&platform=ios&token="
          : "order?isFromiOSApp=true&returnParameter=exitAndroidWebview&platform=android&token="
    };

    var response = await _apiBaseHelper.post(
      url: url,
      body: body,
    );

    return CustomerLoginWebModel.fromJson(response);
  }
}
