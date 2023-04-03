//TODO: This will be the page for that has all of the log objects and daily view of nutrition

import 'dart:io';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:kk_nutrition/constants.dart';
import 'package:kk_nutrition/screens/day_stats.dart';
import 'package:kk_nutrition/screens/search_food.dart';

import '../food_tracking/meal_log.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var buttonBound = (screenWidth / 5);
    var screenHeight = MediaQuery.of(context).size.height;
    var headerBound = (screenHeight / 40);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 50,
              child: Text(
                "Today's nutrition",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const DayStats(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: headerBound,
              child: Text(
                "Breakfast",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: headerBound),
              ),
            ),
            MealLog(meal: "Breakfast"),
            SizedBox(
              height: headerBound,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchBar(meal: "Breakfast")));
                },
                color: Colors.cyan,
                padding: EdgeInsets.symmetric(
                  horizontal: buttonBound,
                  vertical: headerBound,
                ),
                child: Text(
                  "Add Food",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: headerBound),
                ),
              ),
            ),
            SizedBox(
              height: headerBound,
              child: Text(
                "Lunch",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: headerBound),
              ),
            ),
            MealLog(meal: "Lunch"),
            SizedBox(
              height: headerBound,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchBar(meal: "Lunch")));
                },
                color: Colors.cyan,
                padding: EdgeInsets.symmetric(
                  horizontal: buttonBound,
                  vertical: headerBound,
                ),
                child: Text(
                  "Add Food",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: headerBound),
                ),
              ),
            ),
            SizedBox(
              height: headerBound,
              child: Text(
                "Dinner",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: headerBound),
              ),
            ),
            MealLog(meal: "Dinner"),
            SizedBox(
              height: headerBound,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchBar(meal: "Dinner")));
                },
                color: Colors.cyan,
                padding: EdgeInsets.symmetric(
                  horizontal: buttonBound,
                  vertical: headerBound,
                ),
                child: Text(
                  "Add Food",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: headerBound),
                ),
              ),
            ),
            SizedBox(
              height: headerBound,
              child: Text(
                "Snack",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: headerBound),
              ),
            ),
            MealLog(meal: "Snack"),
            SizedBox(
              height: headerBound,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchBar(meal: "Snack")));
                },
                color: Colors.cyan,
                padding: EdgeInsets.symmetric(
                  horizontal: buttonBound,
                  vertical: headerBound,
                ),
                child: Text(
                  "Add Food",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: headerBound),
                ),
              ),
            ),
          ]),
        ));
  }
}
