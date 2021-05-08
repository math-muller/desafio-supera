import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 100,
            width: double.infinity,
            color: Colors.orangeAccent,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
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
            ),
          ),
        );
}
