import 'package:flutter/cupertino.dart';
import 'package:todo_app/screen/splash_screen.dart';
import 'package:todo_app/screen/todo_edit_screen.dart';

import '../screen/home_screen.dart';

Map<String, WidgetBuilder> screenRoutes = {
  '/': (context) => SplashScreen(),
  'home': (context) => HomeScreen(),
  'edit': (context) => TodoEditScreen(),
};
