import 'package:desafio_supera/controller/home_controller.dart';
import 'package:desafio_supera/models/products_model.dart';
import 'package:desafio_supera/pages/checkout/components/dismissible_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text('Carrinho'),
      ),
      bottomSheet: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.grey.withOpacity(.5), width: 2)),
        ),
        child: Column(
          children: [],
        ),
      ),
      body: ListView.builder(
        itemCount: controller.cartItens.length,
        itemBuilder: (_, index) {
          final ProductsModel product = controller.cartItens[index];
          return Dismissible(
            key: Key(product.toString()),
            onDismissed: (diretion) {
              controller.removeProductToCart(product);
            },
            background: DismissibleBar(),
            direction: DismissDirection.endToStart,
            child: Container(
              height: 110,
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
  }
}
