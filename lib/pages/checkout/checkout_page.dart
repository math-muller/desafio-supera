import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../models/models.dart';

import 'components/components.dart';

class CheckoutPage extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Carrinho',
          style: TextStyle(
            color: Colors.orangeAccent,
          ),
        ),
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      bottomSheet: CustomBottomSheetWidget(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (_, index) {
            final ProductsModel product = controller.cartItems[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (diretion) {
                controller.removeProductToCart(product);
                controller.calc();
              },
              background: DismissibleBar(),
              direction: DismissDirection.endToStart,
              child: CartItemWidget(product: product),
            );
          },
        ),
      ),
    );
  }
}
