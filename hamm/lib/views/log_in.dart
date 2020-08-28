import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamm/views/home.dart';
import 'package:local_auth/local_auth.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics=false;    
  bool _isAuthenticating = false;

  @override
  void initState() {
    _checkBiometrics();
    _authenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _canCheckBiometrics
              ? RaisedButton(onPressed: _authenticate, child: Text("INGRESAR"))
              : Text("No hay")
        ],
      ),
    );
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }
 Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scanea tu huella digital para ingresar.',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;        
      });

      if(authenticated == true){
         final route = MaterialPageRoute(
                        builder: (BuildContext _) => Home());
                    Navigator.push(context, route);
      }
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

   
  }
 
}
