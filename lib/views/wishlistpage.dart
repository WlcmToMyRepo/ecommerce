import 'package:ecommerce/controllers/productController.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/views/helper/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListPage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(title: const Text("WishList"), actions: []),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: controller.whishlist.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      onDismissed: (direction) {
                        Product product = controller.whishlist[index];
                        product.isFavourite = false;
                        controller.removeFromWishList(product.id);
                      },
                      key: Key(controller.whishlist[index].id.toString()),
                      child: ProductCard(
                        product: controller.whishlist[index],
                      ));
                }),
          ),
        ));
  }
}


// ListTile(
//                       leading: ClipRRect(
//                         borderRadius: BorderRadius.circular(30),
//                         child: Image.network(
//                           controller.whishlist[index].imageLink,
//                           width: 60,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       title: Text(controller.whishlist[index].name),
//                       subtitle: Text(
//                         "${controller.whishlist[index].price.toString()} Rs",
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleMedium!
//                             .copyWith(fontWeight: FontWeight.bold),
//                       ),
//                     ),