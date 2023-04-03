import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constants {
  //colors
  static const kPrimaryColor = Color(0xFFFFFFFF);
  static const kGreyColor = Color(0xFFEEEEEE);
  static const kBlackColor = Color(0xFF000000);
  static const kDarkGreyColor = Color(0xFF9E9E9E);
  static const kDarkBlueColor = Color(0xFF6057FF);
  static const kBorderColor = Color(0xFFEFEFEF);
//colors

  static const Color primary = Color.fromARGB(255, 63, 230, 79);
  static const Color secondary = Color(0xFFF06292);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color blueGrey = Colors.blueGrey;

  //padding

  static const double appPadding = 20.0;

  //text
  static const textIntro = "Kayla Knows Nutriton \n";
  static const textSignIn = "Sign In";
  static const textSmallSignIn = "Sign In";
  static const textStart = "Get Started";
  static const textSignInTitle = "Welcome back!";
  static const textAcc = "Don't have an account? ";
  static const textSignUp = "Sign Up here";
  static const textHome = "Home";
  static const signUp = "Sign Up ";

  //navigate
  static const homeNavigate = '/home';

  static const statusBarColor = SystemUiOverlayStyle(
      statusBarColor: Constants.kPrimaryColor,
      statusBarIconBrightness: Brightness.dark);
}
