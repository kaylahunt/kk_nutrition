// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:kk_nutrition/screens/sign_up_page.dart';
import 'package:kk_nutrition/services/database.dart';
import 'package:kk_nutrition/food_tracking/food.dart';
import 'package:flutter/material.dart';
import 'package:kk_nutrition/screens/home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:kk_nutrition/constants.dart';

// TODO: This is the page where you see the break down of the food, choose servings amount and then add it to the log
class FoodLog extends StatefulWidget {
  Food food;
  final String meal;
  FoodLog({Key? key, required this.food, required this.meal}) : super(key: key);

  @override
  _FoodLogState createState() => _FoodLogState();
}

class _FoodLogState extends State<FoodLog> {
  late Food food;
  String meal = "";

  //final auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    food = widget.food;
    meal = widget.meal;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    List<PieChartSectionData> _sections = <PieChartSectionData>[];
    int servings = 1;

    PieChartSectionData _fat = PieChartSectionData(
      color: Constants.blueGrey,
      value: (9 * (food.fats) / food.calories) * 100,
      title:
          '', // ((9 * totalFat / totalCalories) * 100).toStringAsFixed(0) + '%',
      radius: 50,
      // titleStyle: TextStyle(color: Colors.white, fontSize: 24),
    );

    PieChartSectionData _carbohydrates = PieChartSectionData(
      color: Constants.secondary,
      value: (4 * (food.carbs) / food.calories) * 100,
      title:
          '', // ((4 * totalCarbs / totalCalories) * 100).toStringAsFixed(0) + '%',
      radius: 50,
      // titleStyle: TextStyle(color: Colors.black, fontSize: 24),
    );

    PieChartSectionData _protein = PieChartSectionData(
      color: Constants.kDarkBlueColor,
      value: (4 * (food.protein) / food.calories) * 100,
      title:
          '', // ((4 * totalProtein / totalCalories) * 100).toStringAsFixed(0) + '%',
      radius: 50,
      // titleStyle: TextStyle(color: Colors.white, fontSize: 24),
    );

    _sections = [_fat, _protein, _carbohydrates];

    var macroData = [food.calories, food.protein, food.carbs, food.fats];

    Widget _chartLabels() {
      return Padding(
        padding: const EdgeInsets.only(top: 78.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text('Carbs ',
                    style: TextStyle(
                      color: Constants.secondary,
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )),
                Text(macroData[2].toStringAsFixed(1) + 'g',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            const SizedBox(height: 3.0),
            Row(
              children: <Widget>[
                const Text('Protein ',
                    style: TextStyle(
                      color: Constants.kDarkBlueColor,
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )),
                Text(macroData[1].toStringAsFixed(1) + 'g',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            const SizedBox(height: 3.0),
            Row(
              children: <Widget>[
                const Text('Fat ',
                    style: TextStyle(
                      color: Constants.blueGrey,
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )),
                Text(macroData[3].toStringAsFixed(1) + 'g',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Open Sans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ],
        ),
      );
    }

    Widget _calorieDisplay() {
      return Container(
        height: 74,
        width: 74,
        decoration: const BoxDecoration(
          color: Color(0xff5FA55A),
          shape: BoxShape.circle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(macroData[0].toStringAsFixed(0),
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w500,
                )),
            const Text('kcal',
                style: TextStyle(
                  fontSize: 14.0,
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
          title: const Text("Search results"),
          backgroundColor: Colors.cyan,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              Stack(alignment: Alignment.center, children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      sections: _sections,
                      borderData: FlBorderData(show: false),
                      centerSpaceRadius: 40,
                      sectionsSpace: 3,
                    ),
                  ),
                ),
                _calorieDisplay(),
              ]),
              _chartLabels(),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 52,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Constants.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Servings Eaten',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    servings = value as int;
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {
                    changeServings(servings);
                  },
                  color: Colors.cyan,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Save Servings",
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 52,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Constants.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: MaterialButton(
                  onPressed: () {
                    //logFood();
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  color: Colors.cyan,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Save Food",
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void changeServings(int servings) {
    Food newFood = Food(
        name: food.name,
        brand: food.brand,
        calories: (servings * food.calories),
        protein: (servings * food.protein),
        carbs: (servings * food.carbs),
        fats: (servings * food.fats),
        servings: servings);
    setState(() {
      food = newFood;
      meal = meal;
    });
  }

  // void logFood() async {
  //   // var user = auth.currentUser!;
  //   Food input = widget.food;
  //   if (widget.meal == "Dinner") {
  //     DatabaseService().addFoodDataDinner(
  //         userId,
  //         input.name,
  //         input.brand,
  //         input.calories,
  //         input.protein,
  //         input.carbs,
  //         input.fats,
  //         input.servings);
  //   }
  //   if (widget.meal == "Lunch") {
  //     DatabaseService().addFoodDataLunch(
  //         userId,
  //         input.name,
  //         input.brand,
  //         input.calories,
  //         input.protein,
  //         input.carbs,
  //         input.fats,
  //         input.servings);
  //   }
  //   if (widget.meal == "Snack") {
  //     DatabaseService().addFoodDataSnack(
  //         userId,
  //         input.name,
  //         input.brand,
  //         input.calories,
  //         input.protein,
  //         input.carbs,
  //         input.fats,
  //         input.servings);
  //   }
  //   if (widget.meal == "Breakfast") {
  //     DatabaseService().addFoodDataBreakfast(
  //         userId,
  //         input.name,
  //         input.brand,
  //         input.calories,
  //         input.protein,
  //         input.carbs,
  //         input.fats,
  //         input.servings);
  //   }
  // }
}
