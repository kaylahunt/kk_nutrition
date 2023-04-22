import 'package:kk_nutrition/screens/food_log.dart';
import 'package:kk_nutrition/screens/search_food.dart';
import 'package:kk_nutrition/screens/sign_in_page.dart';
import 'package:kk_nutrition/screens/sign_up_page.dart';
import 'package:kk_nutrition/screens/home.dart';
import 'package:kk_nutrition/demoScore.dart';
import 'package:flutter/material.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    //'/sign-in': (context) => const SignInPage(),
    '/sign-up': (context) => const SignUpPage(),
    '/demoScore': (context) => DemoScore(),
    '/search': (context) => const SearchBar(meal: 'Breakfast'),
    '/log': (context) => FoodLog(
        meal: 'Breakfast', food_name: 'Chicken', nxid: '-1', servings: 1),
    '/home': (context) => const HomePage(),
  };
}
