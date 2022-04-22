import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String name;
  String brand;
  var images;
  String brief_description;
  String detail_description;

  Product({
    required this.name,
    required this.brand,
    required this.images,
    required this.brief_description,
    required this.detail_description,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        name: json['name'],
        brand: json['brand'],
        images: json['images'],
        brief_description: json['brief_description'],
        detail_description: json['detail_description'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'brand': brand,
        'images': images,
        'brief_description': brief_description,
        'detail_description': detail_description,
      };
}
