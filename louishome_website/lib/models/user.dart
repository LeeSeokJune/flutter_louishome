class User {
  var pk;
  String id;
  String password;
  String name;
  var shoppingCart;
  bool loginBool = false;
  User({
    required this.id,
    required this.password,
    required this.name,
  });
}
