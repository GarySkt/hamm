import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String labelText;
  final bool obscureText;
  final IconData icon;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  const CustomTextField({
    Key key,
    @required this.textEditingController,
    @required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(         
      controller: this.textEditingController,  
      obscureText: this.obscureText,
      style: TextStyle(color: Colors.white),      
      decoration: InputDecoration(    
        prefixIcon: Icon(this.icon),           
          fillColor: Colors.transparent,          
          labelText: this.labelText,
          labelStyle: TextStyle(color: Colors.orange),        
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.circular(30.0),
          )),          
    );
  }
}