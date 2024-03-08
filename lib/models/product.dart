class Product {
  final int id;
  final String name;
  final double price;
  final String imageLink;
  bool isFavourite;
  bool inCart;
  int cartQty;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageLink,
      required this.isFavourite,
      required this.inCart,
      required this.cartQty});
}
