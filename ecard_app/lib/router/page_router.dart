import 'package:ecard_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import '../screens/register_screen.dart';

class PageRouter{
  static Route<dynamic>? switchRoute(RouteSettings settings) {
        switch(settings.name){
          case '/':
            return MaterialPageRoute(builder: (_)=>SplashScreen());

          case '/dashboard':
            // return MaterialPageRoute(builder: (_)=>Dashboard());
            return null;
          case '/register':
            return MaterialPageRoute(builder: (_)=>RegisterPage());

          default:
            return null;
        }
  }
}