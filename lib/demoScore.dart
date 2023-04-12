import 'package:kk_nutrition/food_tracking/food.dart';
import 'package:kk_nutrition/food_tracking/health_score.dart';
import 'package:flutter/material.dart';

var name = "Chicken";
var brand = "";
var calories = 185;
var protein = 27;
var carbs = 0;
var fats = 3;
var servings = 1;
var satFats = 1;
var sodium = 53;
var sugar = 0;

class DemoScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Food food = Food(
        name: name,
        brand: brand,
        calories: calories,
        protein: protein,
        carbs: carbs,
        fats: fats,
        servings: servings);
    // satFats: satFats,
    // sodium: sodium,
    // sugar: sugar);
    HealthScore healthScore = HealthScore(food: food);
    return SizedBox(
      height: 50,
      child: Text(healthScore.healthScore.toString()),
    );
  }
}
