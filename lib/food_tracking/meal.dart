import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'food.dart';
import 'package:kk_nutrition/services/database.dart';

class Meal {
  final String _mealTime;
  final List<Food> _foodItems;
  final Map<String, int> _mealTotals;
  int _healthScore;
  late DatabaseReference _id;

  Meal({@required mealTime})
      : _mealTime = mealTime,
        _foodItems = [],
        _mealTotals = {
          "calories": 0,
          "protein": 0,
          "carbs": 0,
          "fats": 0,
          "servings": 0,
        },
        _healthScore = 0;

  String get meal => _mealTime;
  List<Food> get foodItems => _foodItems;
  Map<String, int> get mealTotals => _mealTotals;
  int get mealHealthScore => _healthScore;

  int addFoodFromList(List<Food> foodToAdd) {
    //add food to the _foodItems list, update the meal totals and health scores
    for (int i = 0; i < foodToAdd.length; i++) {
      _mealTotals["calories"] =
          (_mealTotals["calories"]! + foodToAdd[i].calories);
      _mealTotals["protein"] = (_mealTotals["protein"]! + foodToAdd[i].protein);
      _mealTotals["carbs"] = (_mealTotals["carbs"]! + foodToAdd[i].carbs);
      _mealTotals["fats"] = (_mealTotals["fats"]! + foodToAdd[i].fats);
      _mealTotals["servings"] =
          (_mealTotals["servings"]! + foodToAdd[i].servings);
    }
    _foodItems.addAll(foodToAdd);
    updateMealHealthScore();
    return 0;
  }

  int addFoodItem(Food food) {
    _mealTotals["calories"] = (_mealTotals["calories"]! + food.calories);
    _mealTotals["protein"] = (_mealTotals["protein"]! + food.protein);
    _mealTotals["carbs"] = (_mealTotals["carbs"]! + food.carbs);
    _mealTotals["fats"] = (_mealTotals["fats"]! + food.fats);
    _mealTotals["servings"] = (_mealTotals["servings"]! + food.servings);

    _foodItems.add(food);
    updateMealHealthScore();
    return 0;
  }

  void updateMealHealthScore() {
    //TODO Write method to calculate the meal's updated health score
    //with the given arguments and the current meal's health score
    _healthScore = _mealTotals["calories"]!;
  }

  void setId(DatabaseReference id) {
    _id = id;
  }

  Map<String, dynamic> mealToJson() {
    //foodItemsJson = {fooditemName: {calories:, protein:, carbs:, fats:, servings:}}
    Map<String, dynamic> foodItemsJson = foodItemToJson();

    //want {breakfast: {foodItemsJson}}
    return {
      _mealTime: {
        "Items": foodItemsJson,
        "Totals": _mealTotals,
        "MealHealthScore": _healthScore,
      }
    };
  }

  Map<String, dynamic> foodItemToJson() {
    Map<String, dynamic> json = {};
    for (int i = 0; i < _foodItems.length; i++) {
      json[_foodItems[i].name] = _foodItems[i].foodToJson();
    }
    return json;
  }
}
