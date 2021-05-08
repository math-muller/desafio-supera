import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final dynamic state;

  FilterWidget({required this.state});

  final textStyle = TextStyle(color: Colors.blueAccent);

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
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    backgroundColor: Colors.white,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Filtrar por:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey, height: 20),
                          TextButton(
                            onPressed: () {},
                            child: Text('Maior Preço', style: textStyle),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Menos Preço', style: textStyle),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Popularidade', style: textStyle),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Ordem alfabética', style: textStyle),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'Filtrar',
              style: textStyle,
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
