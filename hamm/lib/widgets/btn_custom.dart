import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;

  const CustomRaisedButton({Key key, this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white,
      child: Text(
        this.label,
        style: TextStyle(color: Colors.orange),
      ),
      onPressed:          
          this.onPressed,
    );
  }
}