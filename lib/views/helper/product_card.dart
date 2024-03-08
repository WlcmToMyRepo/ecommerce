import 'package:ecommerce/controllers/productController.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  final Product? product;
  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.grey,
      // decoration: BoxDecoration(
      //     border: Border.all(
      //   color: Colors.black,
      // )),
      // padding: const EdgeInsets.all(0),
      // margin: const EdgeInsets.all(10),
      // width: 200,
      // height: 300,
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                product!.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
            ],
          ),
          Container(
            // decoration: BoxDecoration(
            //     border: Border.all(
            //   color: Colors.blue,
            // )),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.jpg',
              image: product!.imageLink,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  if (product!.isFavourite == false) {
                    product!.isFavourite = true;
                    controller.addToWishList(product!);
                  } else {
                    product!.isFavourite = false;
                    controller.removeFromWishList(product!.id);
                  }
                },
                icon: product!.isFavourite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      )
                    : const Icon(Icons.favorite_border_outlined, size: 30),
              ),
              Text(
                "${product!.price.toString()}/- Rs",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {
                  if (product!.inCart == false) {
                    product!.inCart = true;
                  }
                  controller.addToCart(product!);
                  print(product!.cartQty);
                },
                child: Row(
                  children: [
                    product!.inCart
                        ? const Icon(
                            Icons.shopping_bag,
                            color: Colors.indigo,
                            size: 30,
                          )
                        : const Icon(
                            Icons.shopping_bag_outlined,
                            size: 30,
                          ),
                    Text(
                      product!.cartQty.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
