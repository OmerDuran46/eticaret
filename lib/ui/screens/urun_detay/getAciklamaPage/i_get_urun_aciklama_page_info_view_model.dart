import 'package:flutter/cupertino.dart';
import 'package:eticaret/core/api/api_response.dart';
import 'package:eticaret/core/models/get_product_comment_model.dart';


abstract class IGetUrunAciklamaInfoViewModel with ChangeNotifier{
  ApiResponse<GetCommentModel> get urunAciklamaResponse;
  set urunAciklamaResponse(ApiResponse<GetCommentModel> value);
  Future<void> getComment(String urunId);
}