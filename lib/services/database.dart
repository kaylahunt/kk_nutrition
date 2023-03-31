import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kaylaknows_nutrition/food_tracking/meal.dart';
import 'package:kaylaknows_nutrition/food_tracking/food.dart';
import 'package:kaylaknows_nutrition/user.dart';

final databaseReference = FirebaseDatabase.instance.ref();

//add to database
DatabaseReference saveUser(User user) {
  var id = databaseReference.child('users/').push();
  id.set({user.toJson()});
  return id;
}

DatabaseReference saveMeal(Meal meal, User user) {
  DateTime now = DateTime.now();
  DateTime date = DateTime(now.year, now.month, now.day);
  String un = user.username;
  var id = databaseReference.child(('users/$un/$date/')).push();
  id.set(meal.mealToJson());
  return id;
}
