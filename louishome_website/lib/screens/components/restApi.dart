import 'dart:convert';
import 'package:louishome_website/models/product.dart';
import 'package:http/http.dart' as http;

class HttpApi {
  var client = http.Client();
  // final baseUrl = 'http://3.128.190.192:8000/';
  final baseUrl = 'http://127.0.0.1:8000/';
  Future getProducts() async {
    var url = Uri.parse(baseUrl + 'product/items');
    var response = await client.get(url);
    var a = jsonDecode(utf8.decode(response.bodyBytes));
    //print(a[0]['name']);
    return a;
  }

  Future<List<Product>> postProducts(var data) async {
    var url = Uri.parse(baseUrl + 'product/items');
    var response = await client.post(url, body: data);
    var a = jsonDecode(utf8.decode(response.bodyBytes));
    //print(a[0]['name']);
    return a;
  }

  Future getItem(var p_id) async {
    var url = Uri.parse(baseUrl + 'product/item/{$p_id}');
    var response = await client.get(url);
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
    var url = Uri.parse(baseUrl + 'shoppingcart/shoppingcart');
    var response = await client.post(url, body: data);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    return jsonData;
  }

  Future<dynamic> getShoppingCart(var data) async {
    var url = Uri.parse(baseUrl + 'shoppingcart/shoppingcartdetail');
    var response = await client.post(url, body: data);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));

    print(jsonData[0]);
    return jsonData;
  }

  Future<dynamic> postReview(var data, String p_id) async {
    var url = Uri.parse(baseUrl + 'product/review/' + p_id);
    var response = await client.post(url, body: data);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    print(jsonData);
    return jsonData;
  }

  Future<dynamic> getReview(String p_id) async {
    var url = Uri.parse(baseUrl + 'product/review/' + p_id);
    var response = await client.get(url);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    print(jsonData);
    return jsonData;
  }

  Future postQuration(var data) async {
    var url = Uri.parse(baseUrl + 'product/quration');
    var response = await client.post(url, body: data);
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
    print(jsonData[0]);
    return jsonData;
  }
}
