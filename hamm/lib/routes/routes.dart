import 'package:flutter/cupertino.dart';
import 'package:hamm/views/detail.dart';
import 'package:hamm/views/home.dart';
import 'package:hamm/views/loading.dart';
import 'package:hamm/views/log_in.dart';
import 'package:hamm/views/register.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'log_in'  : (_) => LogIn(),
  'register': (_) => RegisterPage(),
  'home'    : (_) => Home(),
  'detail'  : (_) => DetailPage(),
  'loading' : (_) => LoadingPage()
};
