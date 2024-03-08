import 'package:ecommerce/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // RxList<Product> dummyProducts = List.generate(10, (index) {
  //   return Product(
  //     id: index + 1,
  //     name: "Product ${index + 1}",
  //     price: (index + 1) * 10.0,
  //     imageLink:
  //         "https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?v=1530129081",
  //     isFavourite: false,
  //     inCart: false,
  //     cartQty: 0,
  //   );
  // }).obs;

  RxList dummyProducts = [
    Product(
        id: 1,
        name: "Biryani",
        price: 200,
        imageLink:
            "https://media.istockphoto.com/id/488481490/photo/fish-biryani-with-basmati-rice-indian-food.jpg?s=612x612&w=0&k=20&c=9xEw3VOQSz9TP8yQr60L47uExyKF9kogRhQdlghlC00=",
        isFavourite: false,
        inCart: false,
        cartQty: 0),
    Product(
        id: 2,
        name: "Fried Rice",
        price: 100,
        imageLink:
            "https://media.istockphoto.com/id/1175434591/photo/fried-rice-with-ketchup-and-soy-sauce.jpg?s=612x612&w=0&k=20&c=h4PypFpU_ktxXBGlw6P-K6t6WfDeJ6PMcCEXb7rwxqk=",
        isFavourite: false,
        inCart: false,
        cartQty: 0),
    Product(
        id: 3,
        name: "Gobi Manchoorian",
        price: 100,
        imageLink:
            "https://www.indianhealthyrecipes.com/wp-content/uploads/2022/02/gobi-manchurian-cauliflower-manchurian.jpg",
        isFavourite: false,
        inCart: false,
        cartQty: 0),
    Product(
        id: 4,
        name: "Noodles",
        price: 120,
        imageLink:
            "https://www.cookwithmanali.com/wp-content/uploads/2021/08/Schezwan-Noodles-480x270.jpg",
        isFavourite: false,
        inCart: false,
        cartQty: 0),
    Product(
        id: 5,
        name: "Butter Chicken",
        price: 300,
        imageLink:
            "https://t3.ftcdn.net/jpg/06/01/41/66/360_F_601416673_Tn9dqtXuujNiavuJnNNspgcDezsStYpD.jpg",
        isFavourite: false,
        inCart: false,
        cartQty: 0),
    Product(
        id: 6,
        name: "Chicken Pepper Dry",
        price: 180,
        imageLink:
            "https://images.sbs.com.au/dims4/default/e64daee/2147483647/strip/true/crop/2000x1125+0+105/resize/1280x720!/quality/90/?url=http%3A%2F%2Fsbs-au-brightspot.s3.amazonaws.com%2Fdrupal%2Ffood%2Fpublic%2Frx066-tcu-s4-on-the-table-in-30-minutes-christine-manfield-chicken-pepper-fry-l.jpg",
        isFavourite: false,
        inCart: false,
        cartQty: 0),
  ].obs;
  final cart = [].obs;

  final whishlist = [].obs;

  void addToCart(Product product) {
    //check if item in cart
    product.cartQty += 1;
    product.inCart = true;
    dummyProducts[dummyProducts
        .indexWhere((element) => element.id == product.id)] = product;
    int index = cart.indexWhere(
      (element) => element.id == product.id,
    );
    if (index > -1) {
      cart[index] = product;
    } else {
      cart.add(product);
    }
    //update qty in dummyList
  }

  void removeFromCart(int productId) {
    print(cart);
    dummyProducts[
            dummyProducts.indexWhere((element) => element.id == productId)]
        .cartQty = 0;
    dummyProducts[
            dummyProducts.indexWhere((element) => element.id == productId)]
        .inCart = false;
    cart.removeWhere((item) => item.id == productId);
  }

  void addToWishList(Product product) {
    whishlist.add(product);
    print(whishlist);
  }

  void removeFromWishList(int productId) {
    print(whishlist);
    whishlist.removeWhere((item) => item.id == productId);
  }

  Product getProduct(Product product) {
    return dummyProducts.firstWhere((element) => element.id == product.id);
  }

  double cartTotalPrice() {
    double total = 0;
    for (Product item in cart) {
      total += item.cartQty * item.price;
    }
    return total;
  }

  void increamentCardQty(Product product) {
    //check if item in cart
    product.cartQty += 1;
    product.inCart = true;
    dummyProducts[dummyProducts
        .indexWhere((element) => element.id == product.id)] = product;
    int index = cart.indexWhere(
      (element) => element.id == product.id,
    );
    if (index > -1) {
      cart[index] = product;
    } else {
      cart.add(product);
    }
    //update qty in dummyList
  }

  void decrementCartQty(Product product) {
    //check if item in cart
    if (product.cartQty > 1) product.cartQty -= 1;
    product.inCart = true;
    dummyProducts[dummyProducts
        .indexWhere((element) => element.id == product.id)] = product;
    int index = cart.indexWhere(
      (element) => element.id == product.id,
    );
    if (index > -1) {
      cart[index] = product;
    } else {
      cart.add(product);
    }
    //upd
  }
}
