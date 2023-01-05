// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/categori_tree_model.dart';
import 'package:eticaret/locator.dart';

import 'i_get_categori_tree_view_model.dart';


class getCategoriTreeInfoViewModel with ChangeNotifier implements IGetCategoriTreeInfoViewModel {
  ApiResponse<CategoriTreeModel> _categoriTreeResponse = ApiResponse.loading(
      "loading");

  @override
  ApiResponse<CategoriTreeModel> get categoriTreeResponse =>
      _categoriTreeResponse;

  @override
  set categoriTreeResponse(ApiResponse<CategoriTreeModel> value) {
    _categoriTreeResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getCategoriTree() async {
    try {
      final result = await locator<Api>().getCategoriTree();
      categoriTreeResponse = ApiResponse.completed(result);
    } catch (e) {
      categoriTreeResponse = ApiResponse.error(e.toString());
    }
  }

}

