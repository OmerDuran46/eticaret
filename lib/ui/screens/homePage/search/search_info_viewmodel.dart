// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/locator.dart';

import '../../../../core/models/search_model.dart';
import 'i_search_info_view_model.dart';


class getSearchInfoViewModel with ChangeNotifier implements IGetSearchInfoViewModel {
  ApiResponse<SearchModel> _searchResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<SearchModel> get searchResponse =>
      _searchResponse;

  @override
  set searchResponse(ApiResponse<SearchModel> value) {
    _searchResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getProductFind(dynamic q) async {
    try {
      final result = await locator<Api>().getProductFind(q: q);
      searchResponse = ApiResponse.completed(result);
    } catch (e) {
      searchResponse = ApiResponse.error(e.toString());
    }
  }

}

