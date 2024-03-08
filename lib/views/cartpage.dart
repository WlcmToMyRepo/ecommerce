import 'package:ecommerce/controllers/productController.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text("CartPage"), actions: []),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: ListView.builder(
                    itemCount: controller.cart.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (direction) {
                          Product product = controller.cart[index];
                          product.inCart = false;
                          controller.removeFromCart(product.id);
                        },
                        key: Key(controller.cart[index].id.toString()),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              controller.cart[index].imageLink,
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(controller.cart[index].name,
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18)),
                          subtitle: Text(
                            "${controller.cart[index].price.toString()}/- Rs",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          // subtitle: Text(
                          //   "${controller.cart[index].price.toString()} Rs",
                          //   style: Theme.of(context).textTheme.bodyMedium,
                          // ),

                          titleAlignment: ListTileTitleAlignment.top,

                          trailing: SizedBox(
                            width: 140,
                            // decoration: BoxDecoration(
                            //     // border: Border.all(color: Colors.red),
                            //     ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () =>
                                        controller.decrementCartQty(
                                            controller.cart[index]),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                      size: 20,
                                    )),
                                Text(
                                  controller.cart[index].cartQty.toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                TextButton(
                                    onPressed: () =>
                                        controller.increamentCardQty(
                                            controller.cart[index]),
                                    child: const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.green,
                                    )),
                              ],
                            ),
                          ),

                          // trailing: Text(
                          //   "${controller.cart[index].price.toString()} Rs",
                          //   style: const TextStyle(fontSize: 20),
                          // ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Total price ${controller.cartTotalPrice()}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {},
                          child: Text(
                            "Buy",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
