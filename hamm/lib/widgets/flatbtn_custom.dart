import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {


  final String text;
  final VoidCallback onPressed;
  
  const CustomFlatButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: this.onPressed,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.white)),
        child: Text(
          this.text,
          style: TextStyle(color: Colors.white),
        ));
  }
}