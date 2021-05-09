import 'package:desafio_supera/controller/home_controller.dart';
import 'package:desafio_supera/models/products_model.dart';
import 'package:desafio_supera/pages/checkout/components/cart_item_widget.dart';
import 'package:desafio_supera/pages/checkout/components/dismissible_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/custom_bottom_sheet_widget.dart';

class CheckoutPage extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text('Carrinho'),
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
