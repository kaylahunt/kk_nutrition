// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:kaylaknows_nutrition/screens/sign_up_page.dart';

// final databaseReference = FirebaseDatabase.instance.ref();

// class DatabaseService {
//   DatabaseService();

//   DatabaseReference saveUser(Map<String, dynamic> json) {
//     var id = databaseReference.child('users/').push();
//     id.set(json);
//     return id;
//   }

//   void addFoodDataDinner(DatabaseReference uid, String name, String brand,
//       int calories, int protein, int carbs, int fats, int servings) {
//     var din_id = uid.child('users/userinfo/foodlog/dinner').push();
//     Map<String, dynamic> food_info = {
//       'name': name,
//       'brand': brand,
//       'calories': calories,
//       'protein': protein,
//       'carbs': carbs,
//       'fats': fats,
//       'servings': servings
//     };
//     din_id.set(food_info);
//   }

//   void addFoodDataLunch(DatabaseReference uid, String name, String brand,
//       int calories, int protein, int carbs, int fats, int servings) {
//     var lunch_id = uid.child('users/userinfo/foodlog/lunch').push();
//     Map<String, dynamic> food_info = {
//       'name': name,
//       'brand': brand,
//       'calories': calories,
//       'protein': protein,
//       'carbs': carbs,
//       'fats': fats,
//       'servings': servings
//     };
//     lunch_id.set(food_info);
//   }

//   void addFoodDataSnack(DatabaseReference uid, String name, String brand,
//       int calories, int protein, int carbs, int fats, int servings) {
//     var snack_id = uid.child('users/userinfo/foodlog/snack').push();
//     Map<String, dynamic> food_info = {
//       'name': name,
//       'brand': brand,
//       'calories': calories,
//       'protein': protein,
//       'carbs': carbs,
//       'fats': fats,
//       'servings': servings
//     };
//     snack_id.set(food_info);
//   }

//   void addFoodDataBreakfast(DatabaseReference uid, String name, String brand,
//       int calories, int protein, int carbs, int fats, int servings) {
//     var bfast_id = uid.child('users/userinfo/foodlog/breakfast').push();
//     Map<String, dynamic> food_info = {
//       'name': name,
//       'brand': brand,
//       'calories': calories,
//       'protein': protein,
//       'carbs': carbs,
//       'fats': fats,
//       'servings': servings
//     };
//     bfast_id.set(food_info);
//   }
// }
