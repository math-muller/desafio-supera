import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final dynamic state;

  FilterWidget({required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade400,
            width: 2,
          ),
        ),
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${state.length} resultados',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Filtrar',
              style: TextStyle(color: Colors.orangeAccent),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Colors.grey.shade100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
