import 'package:desafio_supera/pages/home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

import 'package:desafio_supera/controller/home_controller.dart';
import 'package:desafio_supera/models/products_model.dart';
import 'package:desafio_supera/pages/home/components/app_bar_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orangeAccent,
        splashColor: Colors.orange,
        child: Image(
          height: 25,
          width: 25,
          image: Svg(
            'assets/images/cart-icon.svg',
            color: Colors.white,
          ),
        ),
      ),
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
                return ProductCard(product: product);
              },
            ),
          );
        },
      ),
    );
  }
}
