import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  CustomFloatingActionButtonWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
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
    );
  }
}
