
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {

  final String label;
  final IconData icon;
  final Function onClick;

  MenuItem({
    @required this.label,
    this.icon,
    @required this.onClick
  }) : 
  assert(icon != null),
  assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                  )
                )
              ]
            )
          ),
        ),
      ),
    );
  }
}