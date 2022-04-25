import 'dart:convert';

import 'package:louishome_website/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:louishome_website/models/user.dart';

class HttpApi {
  var client = http.Client();
  Future<List<Product>> getProducts() async {
    var url = Uri.parse('http://3.143.112.117:8000/products/getproducts');
    var response = await client.get(url);
    var a = jsonDecode(utf8.decode(response.bodyBytes));
    //print(a[0]['name']);
    return a;
  }

  Future<List<Product>> postProducts(var data) async {
    var url = Uri.parse('http://3.143.112.117:8000/products/getproducts');
    var response = await client.post(url, body: data);
    var a = jsonDecode(utf8.decode(response.bodyBytes));
    //print(a[0]['name']);
    return a;
  }

  Future<dynamic> loginUser(var data) async {
    var url = Uri.parse('http://3.143.112.117:8000/products/user');

    var response = await client.post(url, body: data);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    return jsonData;
  }

  Future<dynamic> registerUser(var data) async {
    var url = Uri.parse('http://3.143.112.117:8000/products/user');

    var response = await client.post(url, body: data);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    print(data);
    return jsonData;
  }
}
