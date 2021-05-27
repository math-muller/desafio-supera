import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../controller/controller.dart';
import '../../../models/models.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductsModel product;
  final HomeController controller;

  ProductCardWidget({required this.product, required this.controller});

  @override
  Widget build(BuildContext context) {
    var formatNumber = NumberFormat("###.00#", "pt_BR");

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Card(
        child: Row(
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
                    'R\$ ${formatNumber.format(product.price)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 100, top: 10, bottom: 5),
                    child: TextButton(
                      onPressed: () {
                        controller.addProductToCart(product);
                        controller.calc();
                      },
                      child: Text(
                        'Adicionar ao carrinho',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
