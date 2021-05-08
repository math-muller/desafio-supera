import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
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
