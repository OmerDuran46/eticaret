import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/categori_tree_model.dart';

abstract class IGetCategoriTreeInfoViewModel with ChangeNotifier{
  ApiResponse<CategoriTreeModel> get categoriTreeResponse;
  set categoriTreeResponse(ApiResponse<CategoriTreeModel> value);
  Future<void> getCategoriTree();
}
