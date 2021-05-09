import 'package:desafio_supera/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  final HomeController controller = Get.find();

  final textStyle = GoogleFonts.notoSans(
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(.8), width: 1),
        ),
      ),
      child: GetBuilder<HomeController>(
        id: 'cart',
        builder: (_) {
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Subtotal: ',
                        style: textStyle,
                      ),
                      Text('R\$ ${controller.subtotal.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  color: Colors.grey.shade500,
                  endIndent: 10,
                  indent: 10,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total com frete', style: textStyle),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'R\$ ${controller.total.toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          controller.subtotal > 250
                              ? Text(
                                  'Frete Grátis',
                                  style: GoogleFonts.notoSans(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                )
                              : Text(
                                  'Frete: R\$ ${controller.frete}',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                        ],
                      )
                    ],
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
