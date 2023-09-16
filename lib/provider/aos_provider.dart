
import 'dart:convert';
import 'package:aostes/response/categories_response.dart';
import 'package:flutter/services.dart';

mixin AosProvider{

  Future<CategoriesResponse> dummy() async {
    try {
      var response = await rootBundle.loadString("assets/json/categories.json");
      var data = await json.decode(response);
      return CategoriesResponse.fromJson(data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CategoriesResponse.withError("_handleError(error)");
    }
  }


}