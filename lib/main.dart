// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:kaylaknows_nutrition/services/locator.dart';
import 'navigation/navigate.dart';
import 'constants.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

Future main() async {
  //dot_env.dotenv;
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kayla Knows Nutrition",
      initialRoute: '/sign-up',
      routes: Navigate.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
