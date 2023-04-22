// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kk_nutrition/food_tracking/health_score.dart';

import 'package:kk_nutrition/screens/sign_up_page.dart';
import 'package:kk_nutrition/services/database.dart';
import 'package:kk_nutrition/food_tracking/food.dart';
import 'package:flutter/material.dart';
import 'package:kk_nutrition/screens/home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:kk_nutrition/constants.dart';

import '../app_theme.dart';

late Response response;
var dio = Dio();

// TODO: This is the page where you see the break down of the food, choose servings amount and then add it to the log
class FoodLog extends StatefulWidget {
  final String food_name;
  final String nxid;
  final String meal;
  late int servings;
  FoodLog(
      {Key? key,
      required this.food_name,
      required this.nxid,
      required this.meal,
      required this.servings})
      : super(key: key);

  @override
  _FoodLogState createState() => _FoodLogState();
}

class _FoodLogState extends State<FoodLog> {
  String food_name = "";
  String meal = "";
  String nxid = "";
  late Food food;
  int servings = 1;
  int healthScore = 0;

  double alldatacalories = 0;
  double alldatacarbo = 0;
  double alldataprotein = 0;
  double alldatafat = 0;

  int goalProtein = 100;
  int goalFats = 50;
  int goalCarbs = 250;
  int goalCalories = 1850;

  double calspercent = 0;
  double carbspercent = 0;
  double proteinpercent = 0;
  double fatpercent = 0;

  //final auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    food_name = widget.food_name;
    nxid = widget.nxid;
    meal = widget.meal;
    servings = widget.servings;
  }

  Future<Food> setup(int servings) async {
    print("FINGER");
    var response = httprequest(food_name, nxid, servings);
    food = await response;

    healthScore = HealthScore(food: food).healthScore;
    alldatacalories = food.calories;
    alldatacarbo = food.carbs;
    alldataprotein = food.protein;
    alldatafat = food.fats;

    calspercent = alldatacalories / goalCalories;
    carbspercent = alldatacarbo / goalCarbs;
    proteinpercent = alldataprotein / goalProtein;
    fatpercent = alldatafat / goalFats;
    return food;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var bound = (screenWidth / 4);
    var screenHeight = MediaQuery.of(context).size.height;
    var bound2 = (screenHeight / 8);
    // ignore: deprecated_member_use

    Widget _calorieDisplay(int score) {
      return Container(
        height: bound2,
        width: bound,
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
                  fontSize: bound2 / 3,
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w500,
                )),
            Text('Health Score',
                style: TextStyle(
                  fontSize: bound2 / 8,
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      );
    }

    Widget _food_stats() {
      return Stack(children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * .05,
              right: screenWidth * .05,
              top: bound2 / 2,
            ),
            child: Row(children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Calories',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: bound2 / 5,
                        letterSpacing: -0.2,
                        color: AppTheme.darkText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        height: 4,
                        width: bound * 2,
                        decoration: BoxDecoration(
                          color: HexColor('#87A0E5').withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: (calspercent * bound) > bound
                                  ? bound * 2
                                  : (calspercent * bound) < 0
                                      ? 0
                                      : calspercent * bound * 2,
                              height: 4,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  HexColor('#87A0E5'),
                                  HexColor('#87A0E5').withOpacity(0.5),
                                ]),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        (alldatacalories).toStringAsFixed(0) + 'kcal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: bound2 / 6,
                          color: AppTheme.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _calorieDisplay(healthScore),
              )
            ]),
          ),
        ),
        Container(
            child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * .05,
              right: screenWidth * .05,
              top: bound2 * 2,
              bottom: bound2 / 2),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Carbs',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: bound2 / 5,
                        letterSpacing: -0.2,
                        color: AppTheme.darkText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        height: 4,
                        width: bound,
                        decoration: BoxDecoration(
                          color: HexColor('#87A0E5').withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: (carbspercent * bound) > bound
                                  ? bound
                                  : (carbspercent * bound) < 0
                                      ? 0
                                      : carbspercent * bound,
                              height: 4,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  HexColor('#87A0E5'),
                                  HexColor('#87A0E5').withOpacity(0.5),
                                ]),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        (alldatacarbo).toStringAsFixed(0) + 'g',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppTheme.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Protein',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: bound2 / 5,
                            letterSpacing: -0.2,
                            color: AppTheme.darkText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 4,
                            width: bound,
                            decoration: BoxDecoration(
                              color: HexColor('#F56E98').withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: (proteinpercent * bound) > bound
                                      ? bound
                                      : (proteinpercent * bound) < 0
                                          ? 0
                                          : proteinpercent * bound,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      HexColor('#F56E98').withOpacity(0.1),
                                      HexColor('#F56E98'),
                                    ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            (alldataprotein).toStringAsFixed(0) + 'g',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: bound2 / 6,
                              color: AppTheme.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Fat',
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: bound2 / 5,
                            letterSpacing: -0.2,
                            color: AppTheme.darkText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0, top: 4),
                          child: Container(
                            height: 4,
                            width: bound,
                            decoration: BoxDecoration(
                              color: HexColor('#F1B440').withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: (fatpercent * bound) > bound
                                      ? bound
                                      : (fatpercent * bound) < 0
                                          ? 0
                                          : fatpercent * bound,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      HexColor('#F1B440').withOpacity(0.1),
                                      HexColor('#F1B440'),
                                    ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            (alldatafat).toStringAsFixed(0) + 'g',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: bound2 / 6,
                              color: AppTheme.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ))
      ]);
    }

    return FutureBuilder(
      future: setup(servings),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Food Breakdown"),
              backgroundColor: Colors.cyan,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: bound2 * 1.5,
                    child: Text(
                      food_name,
                      style: TextStyle(
                          fontSize: bound2 * 1.25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _food_stats(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: bound / 2,
                        height: 26,
                        padding: const EdgeInsets.only(left: 8, top: 5),
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
                            servings = int.parse(value);
                          },
                        ),
                      ),
                      MaterialButton(
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
                          "Change",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MaterialButton(
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
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  void changeServings(int servings) {
    setState(() {
      widget.servings = servings;
    });
  }

  Future<Food> httprequest(String name, String nxid, int servings) async {
    dio.options.headers['x-app-id'] = "6fdef0e0";
    dio.options.headers["x-app-key"] = "e0d0ffe1141be81087401c46402ff78b";

    Food results = Food(
        name: name,
        brand: "brand",
        calories: 0,
        protein: 0,
        carbs: 0,
        fats: 0,
        satFats: 0,
        sugar: 0,
        sodium: 0,
        servings: servings);
    try {
      if (nxid == "-1") {
        dio.options.headers['content'] = "application/json";
        dio.options.headers['Content-Type'] =
            "application/x-www-form-urlencoded";
        response = await dio.post(
            'https://trackapi.nutritionix.com/v2/natural/nutrients',
            data: {'query': name});
      } else {
        response = await dio.get(
          "https://trackapi.nutritionix.com/v2/search/item?nix_item_id=$nxid",
        );
      }
      if (response.statusCode == 200) {
        var foodSec = response.data['foods'][0];
        print(foodSec);
        Food entry = Food(
            name: (foodSec['food_name'] ?? name).toString(),
            brand: (foodSec['brand_name'] ?? "None").toString(),
            calories: servings *
                double.parse((foodSec['nf_calories'] ?? 0).toString()),
            protein: servings *
                double.parse((foodSec['nf_protein'] ?? 0).toString()),
            carbs: servings *
                double.parse((foodSec['nf_total_carbohydrate'] ??
                        foodSec['nf_carbohydrates'] ??
                        0)
                    .toString()),
            fats: servings *
                double.parse((foodSec['nf_total_fat'] ?? 0).toString()),
            satFats: servings *
                double.parse((foodSec['nf_saturated_fat'] ?? 0).toString()),
            sodium: double.parse((foodSec['nf_sodium'] ?? 0).toString()),
            sugar: double.parse((foodSec['nf_sugars'] ?? 0).toString()),
            servings: servings);
        results = entry;
      }
      return results;
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: 'Food not found. Try again', gravity: ToastGravity.TOP);
      return results;
    }
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
