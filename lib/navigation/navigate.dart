import 'package:kaylaknows_nutrition/screens/sign_in_page.dart';
import 'package:kaylaknows_nutrition/screens/sign_up_page.dart';
import 'package:kaylaknows_nutrition/screens/home.dart';
import 'package:flutter/material.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    //'/sign-in': (context) => const SignInPage(),
    '/sign-up': (context) => const SignUpPage(),
    //'/home': (context) => const HomePage(DatabaseReference userId:,),
  };
}
