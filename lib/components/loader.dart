import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String message;

  Loader({this.message = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text(message),
        ],
      ),
    );
  }
}
