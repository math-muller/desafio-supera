import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 120,
            width: double.infinity,
            color: Colors.deepOrange,
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16, top: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {},
                        child: Image(
                          height: 30,
                          width: 30,
                          image: Svg(
                            'assets/images/cart-icon.svg',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_border, color: Colors.white, size: 15),
                        Text(
                          'Game Store',
                          style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.star_border, color: Colors.white, size: 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
