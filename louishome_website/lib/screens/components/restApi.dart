import 'dart:convert';

import 'package:louishome_website/models/product.dart';
import 'package:http/http.dart' as http;

class HttpApi {
  var client = http.Client();
  final baseUrl = 'http://3.128.190.192:8000/';
  Future<List<Product>> getProducts() async {
    var url = Uri.parse(baseUrl + 'products/items');
    var response = await client.get(url);
    var a = jsonDecode(utf8.decode(response.bodyBytes));
    //print(a[0]['name']);
    return a;
  }

  Future<List<Product>> postProducts(var data) async {
    var url = Uri.parse(baseUrl + 'product/getproducts');
    var response = await client.post(url, body: data);
    var a = jsonDecode(utf8.decode(response.bodyBytes));
    //print(a[0]['name']);
    return a;
  }

  Future<dynamic> loginUser(var data) async {
    var url = Uri.parse(baseUrl + 'user/user/0');

    var response = await client.post(url, body: data);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    print(jsonData);
    return jsonData;
  }

  Future<dynamic> registerUser(var data) async {
    print('register');
    var url = Uri.parse(baseUrl + 'user/user/1');

    var response = await client.post(url, body: data);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    return jsonData;
  }

  Future<dynamic> postShoppingCart(var data) async {
    var url = Uri.parse(baseUrl + 'user/shoppingcart');
    var response = await client.post(url, body: data);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    return jsonData;
  }
}
