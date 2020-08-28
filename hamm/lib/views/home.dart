import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
                  child: Column(
      children: <Widget>[
          Text("Mis Cuentas",style: TextStyle(fontSize: 40.0),),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  title: Text("Necesidades"),
                )
                ],
            ),
          )
      ],
    ),
        ));
  }
}
