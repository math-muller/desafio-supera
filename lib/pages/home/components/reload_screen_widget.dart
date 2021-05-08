import 'package:flutter/material.dart';

class ReloadScreenWidget extends StatelessWidget {
  final Future<void> Function() reload;
  final String? error;

  ReloadScreenWidget({required this.reload, required this.error});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error ?? ""),
          TextButton(
            onPressed: reload,
            child: Text(
              'Tentar Novamente',
              style: TextStyle(
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Colors.orangeAccent.withOpacity(.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
