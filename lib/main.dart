import 'package:flutter/material.dart';

void main() {
  runApp(
    Column(
      children: const <Widget>[
        Text(
          'Hello World!',
          textDirection: TextDirection.ltr,
        ),
        Text(
          'Bytebank',
          textDirection: TextDirection.ltr,
        ),
        Expanded(child: FittedBox(fit: BoxFit.contain, child: FlutterLogo()))
      ],
    ),
  );
}
