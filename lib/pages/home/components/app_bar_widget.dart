import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({required HomeController controller})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 100,
            width: double.infinity,
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 5),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.orangeAccent,
                          size: 15,
                        ),
                        Text(
                          'Game Store',
                          style: GoogleFonts.notoSans(
                            color: Colors.orangeAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.orangeAccent,
                          size: 15,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: controller.goToCheckout,
                          child: Stack(
                            children: [
                              Image(
                                height: 22,
                                width: 22,
                                image: Svg(
                                  'assets/images/cart-icon.svg',
                                  color: Colors.black,
                                ),
                              ),
                              GetBuilder<HomeController>(
                                id: 'cart',
                                builder: (_) => controller.itemsCart != 0
                                    ? Container(
                                        margin: EdgeInsets.only(left: 22),
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${controller.itemsCart}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
}
