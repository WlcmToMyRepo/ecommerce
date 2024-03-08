/*
  display items from the data, with grid layout
  place two icons in action of app bar
*/

import 'package:ecommerce/controllers/productController.dart';
import 'package:ecommerce/views/cartpage.dart';
import 'package:ecommerce/views/helper/product_card.dart';
import 'package:ecommerce/views/wishlistpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
          actions: [
            Badge.count(
              offset: const Offset(-2, 2),
              count: controller.whishlist.length,
              child: IconButton(
                onPressed: () {
                  Get.to(WishListPage());
                },
                icon: const Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.purple,
                  size: 30,
                ),
              ),
            ),
            // WishListButton(controller.whishlist.length),
            const SizedBox(
              width: 5,
            ),
            // CartButton(controller.cart.length),
            Badge.count(
              offset: const Offset(-2, 2),
              count: controller.cart.length,
              child: IconButton(
                onPressed: () {
                  Get.to(CartPage());
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.purple,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Set the number of columns
              crossAxisSpacing: 5.0, // Set the spacing between columns
              mainAxisSpacing: 8.0, // Set the spacing between rows
            ),
            itemCount: controller.dummyProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: controller.dummyProducts[index]);
            },
          ),
        ),
      ),
    );
  }
}
