import 'package:desafio_supera/controller/home_controller.dart';
import 'package:desafio_supera/models/products_model.dart';
import 'package:desafio_supera/pages/home/components/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                'assets/images/${product.image}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: GoogleFonts.notoSans(fontSize: 13),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'R\$ ${product.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
