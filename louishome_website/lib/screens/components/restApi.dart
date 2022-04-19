import 'dart:convert';

import 'package:louishome_website/data/product.dart';
import 'package:http/http.dart' as http;

class HttpApi {
  var client = http.Client();
  Future<List<Product>> getProducts() async {
    var url = Uri.parse('http://3.143.112.117:8000/products/getproducts/');
    var response = await client.get(url);
    var a = jsonDecode(utf8.decode(response.bodyBytes));
    //print(a[0]['name']);
    return a;
  }
}
