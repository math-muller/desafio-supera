import 'package:flutter/material.dart';

class DismissibleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.orangeAccent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
