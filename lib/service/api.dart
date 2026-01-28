import 'dart:convert';
import 'package:homework6/model/product_model.dart';
import 'package:http/http.dart' as http;

class Api {

  String link = "https://dummyjson.com/products";

  Future<List<ProductModel>> getProduct()async{
    var uri = Uri.parse(link);
    var response = await http.get(uri);
    var result = jsonDecode(response.body);

  // you can move this list to global data
    List<ProductModel> list = [];

    for (var element in result["products"]) {
      ProductModel p1 = ProductModel.fromJson(element);
      list.add(p1);
    }

    return list;
  }
}

