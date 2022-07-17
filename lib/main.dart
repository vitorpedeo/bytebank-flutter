import 'package:flutter/material.dart';

import 'package:bytebank/screens/transferencia/lista.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Colors.green[900]),
        colorScheme:
            theme.colorScheme.copyWith(secondary: Colors.blueAccent[700]),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blueAccent),
          ),
        ),
      ),
      home: ListaTransferencias(),
    );
  }
}
