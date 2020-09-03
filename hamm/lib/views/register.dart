import 'package:flutter/material.dart';
import 'package:hamm/utils/hiddenScrollBehavior.dart';
import 'package:hamm/views/home.dart';
import 'package:hamm/widgets/btn_custom.dart';
import 'package:hamm/widgets/textfield_custom.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    final EdgeInsets padding = mediaQuery.padding;

    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Registro",
                  style: TextStyle(fontSize: 50.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  textEditingController: nameController,
                  labelText: "Nombres y Apellidos",                  
                ),
                SizedBox(height: 10.0),
                CustomTextField(
                  textEditingController: phoneController,
                  labelText: "Nro. Celular",                  
                ),
                SizedBox(height: 10.0),
                CustomTextField(
                  textEditingController: emailController,
                  labelText: "Correo Electrónico",                  
                ),
                SizedBox(height: 10.0),
                CustomTextField(
                  textEditingController: passwordController,
                  labelText: "Contraseña",
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                CustomRaisedButton(
                  label: "REGISTRARME",
                  onPressed: () {
                    final route =
                        MaterialPageRoute(builder: (BuildContext _) => Home());
                    Navigator.push(context, route);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                _alreadyAccountButton(context),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _alreadyAccountButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        // final route = MaterialPageRoute(
        //     builder: (BuildContext _) => InicioSesionUsuario());
        // Navigator.push(context, route);
        Navigator.of(context).pop();
      },
      child: Text(
        "¿Ya tienes una cuenta?",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
