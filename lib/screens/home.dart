//TODO: This will be the page for that has all of the log objects and daily view of nutrition

import 'dart:io';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:kk_nutrition/constants.dart';
import 'package:kk_nutrition/food_tracking/meal.dart';
import 'package:kk_nutrition/screens/day_stats.dart';
import 'package:kk_nutrition/screens/search_food.dart';

import '../food_tracking/meal_log.dart';
import 'customize_diet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var buttonBound = (screenWidth / 3);
    var screenHeight = MediaQuery.of(context).size.height;
    var headerBound = (screenHeight / 24);

    Widget _calorieDisplay(int score) {
      return Container(
        height: headerBound,
        width: buttonBound / 4,
        decoration: const BoxDecoration(
          color: Color(0xff5FA55A),
          shape: BoxShape.circle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(score.toString(),
                style: TextStyle(
                  fontSize: headerBound / 2,
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: headerBound * 1.5,
              child: Text(
                "Today's nutrition",
                style: TextStyle(
                    fontSize: headerBound * 1.25, fontWeight: FontWeight.bold),
              ),
            ),
            const DayStats(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: headerBound,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Breakfast",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: headerBound),
                    ),
                    _calorieDisplay(breakfastMeal.mealHealthScore)
                  ],
                ),
              ),
            ),
            MealLog(meal: "Breakfast"),
            Padding(
              padding: EdgeInsets.only(bottom: headerBound / 2),
              child: SizedBox(
                height: headerBound * .8,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                const SearchBar(meal: "Breakfast")));
                  },
                  color: Colors.cyan,
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonBound / 2,
                  ),
                  child: Text(
                    "Add Food",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: headerBound * .7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: headerBound,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lunch",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: headerBound),
                    ),
                    _calorieDisplay(lunchMeal.mealHealthScore)
                  ],
                ),
              ),
            ),
            MealLog(meal: "Lunch"),
            Padding(
              padding: EdgeInsets.only(bottom: headerBound / 2),
              child: SizedBox(
                height: headerBound * .8,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                const SearchBar(meal: "Lunch")));
                  },
                  color: Colors.cyan,
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonBound / 2,
                  ),
                  child: Text(
                    "Add Food",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: headerBound * .7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: headerBound,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dinner",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: headerBound),
                    ),
                    _calorieDisplay(dinnerMeal.mealHealthScore)
                  ],
                ),
              ),
            ),
            MealLog(meal: "Dinner"),
            Padding(
              padding: EdgeInsets.only(bottom: headerBound / 2),
              child: SizedBox(
                height: headerBound * .8,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                const SearchBar(meal: "Dinner")));
                  },
                  color: Colors.cyan,
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonBound / 2,
                  ),
                  child: Text(
                    "Add Food",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: headerBound * .7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: headerBound,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Snack",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: headerBound),
                    ),
                    _calorieDisplay(snackMeal.mealHealthScore)
                  ],
                ),
              ),
            ),
            MealLog(meal: "Snack"),
            Padding(
              padding: EdgeInsets.only(bottom: headerBound / 2),
              child: SizedBox(
                height: headerBound * .8,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                const SearchBar(meal: "Snack")));
                  },
                  color: Colors.cyan,
                  padding: EdgeInsets.symmetric(
                    horizontal: buttonBound / 2,
                  ),
                  child: Text(
                    "Add Food",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: headerBound * .7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: headerBound,
            ),
          ]),
        ));
  }
}
