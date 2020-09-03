import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamm/utils/hiddenScrollBehavior.dart';
import 'package:hamm/views/home.dart';
import 'package:hamm/views/register.dart';
import 'package:hamm/widgets/btn_custom.dart';
import 'package:hamm/widgets/flatbtn_custom.dart';
import 'package:hamm/widgets/textfield_custom.dart';
import 'package:local_auth/local_auth.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  bool _isAuthenticating = false;

  @override
  void initState() {
    _checkBiometrics();
    // _authenticate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final EdgeInsets padding = mediaQuery.padding;
    return Scaffold(
      backgroundColor: Color.fromRGBO(103, 84, 115, 1),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: HiddenScrollBehavior(),
          child: SingleChildScrollView(
            child: Container(
              height: size.height - padding.top - padding.bottom,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/humm.png',
                    height: 250.0,
                    width: 250.0,
                  ),
                  _Form(),
                  _canCheckBiometrics
                      ? RaisedButton(
                          onPressed: _authenticate, child: Text("Huella"))
                      : Text("No hay")
                ],
              ),
            ),
          ),
        ),
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

      if (authenticated == true) {
        final route = MaterialPageRoute(builder: (BuildContext _) => Home());
        Navigator.push(context, route);
      }
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
          SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    icon: Icons.mail_outline,
                    labelText: "Correo Electrónico",
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: emailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    icon: Icons.lock_outline,
                    textEditingController: passwordController,
                    keyboardType: TextInputType.visiblePassword,                    
                    labelText: "Contraseña",
                    obscureText: true,                    
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomRaisedButton(
                    label: "INGRESAR",
                    onPressed: () {
                      print(emailController.text);
                    },
                  ),
                  CustomFlatButton(
                    text: "REGISTRARME",
                    onPressed: () {
                      final route = MaterialPageRoute(
                          builder: (BuildContext _) => RegisterPage());
                      Navigator.push(context, route);
                    },
                  ),
      ],),
    );
  }
}
