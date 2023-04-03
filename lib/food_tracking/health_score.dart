import 'package:flutter/material.dart';
import 'package:kk_nutrition/food_tracking/food.dart';

class HealthScore {
  final Food _food;
  int _calories;
  int _protein;
  int _carbs;
  int _fats;
  int _servings;
  int _healthScore;
  int _satFat;
  int _sodium;
  int _sugar;

  HealthScore({
    @required food,
  })  : this._food = food,
        this._calories = food.calories,
        this._protein = food.protein,
        this._carbs = food.carbs,
        this._fats = food.fats,
        this._servings = food.servings,
        this._satFat = food.satFats,
        this._sodium = food.sodium,
        this._sugar = food.sugar,
        this._healthScore = 0 {
    int goalProtein = 100;
    int goalFats = 50;
    int goalCarbs = 250;
    int goalCalories = 1850;

    var percentCalories = _calories / goalCalories;
    var foodGoalProtein = goalProtein * percentCalories;
    var foodGoalCarbs = goalCarbs * percentCalories;
    var foodGoalFats = goalFats * percentCalories;
    var sodiumLimit = (goalCalories / 2000) * percentCalories * 2300;
    var sugarLimit = ((goalCalories / 2000) * .05) / 4;
    var satFatsLimit = foodGoalFats * .3;

    var carbScore = _carbs / foodGoalCarbs;
    foodGoalProtein =
        carbScore < .1 ? foodGoalProtein + foodGoalCarbs : foodGoalProtein;
    carbScore = carbScore < .1 ? 1 : carbScore;

    if (carbScore > 1) {
      var overflow = carbScore - 1;
      carbScore = 1 - (overflow * 1.5);
    }

    var proteinScore = _protein / foodGoalProtein;
    if (proteinScore > 1) {
      var overflow = proteinScore - 1;
      proteinScore = 1 - (overflow * 2);
    }

    var fatScore = _fats / foodGoalFats;
    if (fatScore > 1) {
      var overflow = fatScore - 1;
      fatScore = 1 - (overflow * 2);
    }

    var sodiumScore = _sodium / sodiumLimit;
    var sugarScore = _sugar / sugarLimit;
    var satFatsScore = _satFat / satFatsLimit;
    var macroScore = ((proteinScore + carbScore + fatScore) * 33).round();
    print(macroScore);
    var badMicroScore = ((sodiumScore + sugarScore + satFatsScore) * 5).round();
    print(badMicroScore);
    var goodMicroScore = 0;

    _healthScore = macroScore - badMicroScore + goodMicroScore;
    print(_healthScore);
  }

  int get healthScore => _healthScore;

  Map<String, int> foodToJson() {
    return {
      'calories': _calories,
      'proteins': _protein,
      'carbs': _carbs,
      'fats': _fats,
      'servings': _servings
    };
  }
}
