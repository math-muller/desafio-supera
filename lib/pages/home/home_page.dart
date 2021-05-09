import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../models/models.dart';

import 'components/components.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(controller: controller),
      body: controller.obx(
        (state) {
          return Stack(
            children: [
              FilterWidget(state: state),
              Padding(
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
                    return ProductCardWidget(
                      product: product,
                      controller: controller,
                    );
                  },
                ),
              ),
            ],
          );
        },
        onError: (e) {
          return ReloadScreenWidget(reload: controller.findProducts, error: e);
        },
      ),
    );
  }
}
