import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:desafio_supera/pages/home/components/custom_floating_action_button_widget.dart';
import 'package:desafio_supera/pages/home/components/product_card_widget.dart';
import 'package:desafio_supera/controller/home_controller.dart';
import 'package:desafio_supera/models/products_model.dart';
import 'package:desafio_supera/pages/home/components/app_bar_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButtonWidget(),
      appBar: AppBarWidget(),
      body: controller.obx(
        (state) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 4.0,
                childAspectRatio: 2.6,
              ),
              itemCount: state.length,
              itemBuilder: (_, index) {
                final ProductsModel product = state[index];
                return ProductCardWidget(product: product);
              },
            ),
          );
        },
        onError: (e) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(e!),
                TextButton(
                  onPressed: controller.findProducts,
                  child: Text(
                    'Tentar Novamente',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      Colors.orangeAccent.withOpacity(.2),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
