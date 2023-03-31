//TODO: This will be the page for that has all of the log objects and daily view of nutrition

import 'dart:io';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:kaylaknows_nutrition/constants.dart';
import 'package:kaylaknows_nutrition/screens/day_stats.dart';
import 'package:kaylaknows_nutrition/screens/search_food.dart';

import '../food_tracking/meal_log.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 50,
              child: Text("Today's nutrition"),
            ),
            //const DayStats(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 25,
              child: Text("Breakfast"),
            ),
            MealLog(meal: "Breakfast"),
            SizedBox(
              height: 25,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchBar(meal: "Breakfast")));
                },
                color: Colors.cyan,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: const Text(
                  "Add Food",
                ),
              ),
            ),
            const SizedBox(
              height: 25,
              child: Text("Lunch"),
            ),
            MealLog(meal: "Lunch"),
            SizedBox(
              height: 25,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchBar(meal: "Lunch")));
                },
                color: Colors.cyan,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: const Text(
                  "Add Food",
                ),
              ),
            ),
            const SizedBox(
              height: 25,
              child: Text("Dinner"),
            ),
            MealLog(meal: "Dinner"),
            SizedBox(
              height: 25,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchBar(meal: "Dinner")));
                },
                color: Colors.cyan,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: const Text(
                  "Add Food",
                ),
              ),
            ),
            const SizedBox(
              height: 25,
              child: Text("Snack"),
            ),
            MealLog(meal: "Snack"),
            SizedBox(
              height: 25,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchBar(meal: "Snack")));
                },
                color: Colors.cyan,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: const Text(
                  "Add Food",
                ),
              ),
            ),
          ]),
        ));
  }
}
