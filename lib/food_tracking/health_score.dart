import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kk_nutrition/food_tracking/food.dart';

import '../screens/customize_diet.dart';

class HealthScore {
  final Food _food;
  double _calories;
  double _protein;
  double _carbs;
  double _fats;
  double _servings;
  double _satFat;
  double _sodium;
  double _sugar;
  double _fiber;
  double _potassium;
  int _healthScore;
  List<String> pros = [];
  List<String> con = [];

  HealthScore({@required food})
      : this._food = food,
        this._calories = food.calories,
        this._protein = food.protein,
        this._carbs = food.carbs,
        this._fats = food.fats,
        this._servings = food.servings,
        this._satFat = food.satFats,
        this._sodium = food.sodium,
        this._sugar = food.sugar,
        this._fiber = food.fiber,
        this._potassium = food.potassium,
        this._healthScore = 0 {
    var percentCalories = _calories / goalCalories;
    var foodGoalProtein = goalProtein * percentCalories;
    var foodGoalCarbs = goalCarbs * percentCalories;
    var foodGoalFats = goalFats * percentCalories;
    var ogfoodGoalFats = goalFats * percentCalories;
    var sodiumLimit = (goalCalories / 2000) * percentCalories * 2300;
    var sugarLimit = ((goalCalories * .05) * percentCalories) / 4 + _fiber * 5;
    var goalFiber = (goalCalories / 2000) * percentCalories * 28;
    var goalPotassium = (goalCalories / 2000) * percentCalories * 4800;
    var goalCalcium = (goalCalories / 2000) * percentCalories * 1300;
    bool oil = false;

    var carbScore = _carbs / foodGoalCarbs;
    var proteinScore = _protein / foodGoalProtein;
    var fatScore = _fats / foodGoalFats;

    print(foodGoalFats);
    print(foodGoalCarbs);
    print(foodGoalProtein);

    if (percentCalories < .25) {
      if (carbScore < .2) {
        pros.add("Light Carb");
        if (fatScore < .1) {
          foodGoalProtein = foodGoalProtein +
              ((1 - fatScore) * 9 / 4) * foodGoalFats +
              foodGoalCarbs * (1 - carbScore);
          foodGoalCarbs = foodGoalCarbs * carbScore;
          foodGoalFats = foodGoalFats * fatScore;
          pros.add("Low Fat");
        } else if (proteinScore < .05) {
          foodGoalFats = foodGoalFats +
              (foodGoalCarbs * .99 + .99 * foodGoalProtein) * 4 / 9;
          foodGoalProtein = foodGoalProtein * .01;
          foodGoalCarbs = foodGoalCarbs * .01;
          oil = true;
          con.add("Oil");
        } else {
          foodGoalProtein =
              foodGoalProtein + foodGoalCarbs * (1 - carbScore) * .75;
          foodGoalFats =
              foodGoalFats + (foodGoalCarbs * (1 - carbScore) * .25) * 4 / 9;
          foodGoalCarbs = foodGoalCarbs * carbScore;
        }
      } else if (proteinScore < .1) {
        if (fatScore < .1) {
          foodGoalCarbs = foodGoalCarbs +
              foodGoalProtein * (1 - proteinScore) +
              ((1 - fatScore) * 9 / 4) * foodGoalFats;
          foodGoalProtein = foodGoalProtein * proteinScore;
          foodGoalFats = foodGoalFats * fatScore;
          pros.add("Low Fat");
        }
      }
    }
    print(foodGoalFats);
    print(foodGoalCarbs);
    print(foodGoalProtein);
    var satFatsLimit = foodGoalFats * .3;
    carbScore =
        (_carbs < 5 && foodGoalCarbs < 5) ? 1 : (_carbs / foodGoalCarbs);
    proteinScore = (_protein < 5 && foodGoalProtein < 5)
        ? 1
        : (_protein / foodGoalProtein);
    fatScore = (_fats < 3 && foodGoalFats < 3) ? 1 : (_fats / foodGoalFats);

    print(carbScore);
    print(proteinScore);
    print(fatScore);

    var sodiumScore = (_sodium - sodiumLimit) / sodiumLimit;
    print(sodiumScore);
    var sugarScore = _sugar - sugarLimit;
    print(sugarScore);
    var satFatsScore = _satFat - satFatsLimit;
    print(satFatsScore);
    var fiberScore = (sugarScore < 0) ? (_fiber / goalFiber) : 0;
    print(fiberScore);
    var pottasiumScore = _potassium / goalPotassium;
    print(pottasiumScore);

    if (sugarScore < 3) {
      if (carbScore > .2 && carbScore < .6) {
        con.add("Not Enough Carbs");
      } else if (carbScore > .6 && carbScore < .85 && _carbs > 15) {
        pros.add("Good source of Carbs");
      } else if (carbScore <= 1.05 && _carbs > 20) {
        pros.add("Great source of Carbs");
      }
    } else {
      con.add("Too much sugar");
    }

    if (sodiumScore > 1.5) {
      con.add("Too much sodium");
    }

    if (proteinScore > .2 && proteinScore < .6) {
      con.add("Not Enough Protein");
    } else if (proteinScore > .6 && proteinScore < .85 && _protein > 8) {
      pros.add("Good source of Protein");
    } else if (proteinScore <= 1.05 && _protein > 15) {
      pros.add("Great source of Protein");
    }

    if (satFatsScore < 1) {
      if (fatScore > .2 && fatScore < .6) {
        con.add("Not Enough Fat");
      } else if (fatScore > .6 && fatScore < .85 && _fats > 3) {
        pros.add("Good source of Fat");
      } else if (fatScore <= 1.05 && _fats > 6) {
        pros.add("Great source of Fat");
      }
    } else {
      con.add("Too much Saturated Fat");
    }

    if (fiberScore > 1) {
      pros.add("Good source of Fiber");
    }

    if (pottasiumScore > 1) {
      pros.add("Good source of Pottasium");
    }

    if (carbScore > 1) {
      var overflow = _carbs - foodGoalCarbs;
      if (overflow > 10) {
        con.add("Excess Carbs");
      }
      carbScore = 1 - (overflow * .015);
    }

    if (proteinScore > 1) {
      var overflow = _protein - foodGoalProtein;
      if (overflow > 15) {
        con.add("Excess Protein");
      }
      proteinScore = 1 - (overflow * .015);
    }

    if (fatScore > 1) {
      var overflow = _fats - foodGoalFats;
      if (overflow > 5) {
        con.add("Excess Fats");
      }
      fatScore = 1 - (overflow * .02);
    }

    var macroScore = ((proteinScore + carbScore + fatScore) * 33).round();
    if (oil) {
      macroScore -= (2.5 * (_fats - ogfoodGoalFats)).round();
    }
    print(macroScore);
    var badMicroScore = max(
        0,
        (min(sodiumScore * .5, 10) +
                min(sugarScore * 1.25, 33) +
                min(satFatsScore * 1.5, 33))
            .round());
    print(badMicroScore);

    var goodMicroScore =
        max(0, (min(fiberScore, 3) + min(pottasiumScore, 2)).round());

    _healthScore =
        max(0, min((macroScore - badMicroScore + goodMicroScore).round(), 100));
    print(_healthScore);
  }

  int get healthScore => _healthScore;

  List<String> get cons => con;

  List<String> get pro => pros;
}
