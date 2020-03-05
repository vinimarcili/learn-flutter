import 'package:flutter/material.dart';

void main() => runApp(
  Column(
    children: <Widget>[
      Text(
        'Oie',
        textDirection: TextDirection.ltr,
      ),
      Text(
        'Doido',
        textDirection: TextDirection.ltr,
      ),
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain,
          child: const FlutterLogo(),
        ),
      ),
    ],
  )
);