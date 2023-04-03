import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'navigation/navigate.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kayla Knows Nutrition",
      initialRoute: '/demoScore',
      routes: Navigate.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
