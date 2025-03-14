import 'package:ecard_app/screens/dashboard_screen.dart';
import 'package:ecard_app/screens/login_screen.dart';
import 'package:ecard_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import '../screens/forgot_password.dart';
import '../screens/register_screen.dart';

class PageRouter{
  static Route<dynamic>? switchRoute(RouteSettings settings) {
        switch(settings.name){
          case '/':
            return MaterialPageRoute(builder: (_)=>SplashScreen());

          case '/dashboard':
            return MaterialPageRoute(builder: (_)=>DashboardPage());
          case '/register':
            return MaterialPageRoute(builder: (_)=>RegisterPage());
          case '/login':
            return MaterialPageRoute(builder: (_)=>LoginPage());
          case '/forgot_password':
            return MaterialPageRoute(builder: (_)=>ForgotPassword());

          default:
            return null;
        }
  }
}
