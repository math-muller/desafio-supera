import 'package:desafio_supera/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterWidget extends StatelessWidget {
  final dynamic state;

  FilterWidget({required this.state});

  final textStyle = TextStyle(color: Colors.blueAccent);
  final HomeController controller = Get.find();

  final dropdownItems = <String>[
    'Filtrar',
    'Maior Valor',
    'Menor Valor',
    'Popularidade',
    'Ord. Alfabética'
  ];

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
          DropdownButton<String>(
            value: controller.filter,
            elevation: 10,
            style: const TextStyle(color: Colors.blueAccent),
            onChanged: (String? newValue) {
              controller.loadFilter(newValue!);
            },
            items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
