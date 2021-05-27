import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/models.dart';

class CartItemWidget extends StatelessWidget {
  final ProductsModel product;

  CartItemWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    var formatNumber = NumberFormat("###.00#", "pt_BR");

    return Container(
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
                    'R\$ ${formatNumber.format(product.price)}',
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
    );
  }
}
