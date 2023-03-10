import 'package:flutter/material.dart';

class Food {
  final String _name;
  final String _brand;
  final int _calories;
  final int _protein;
  final int _carbs;
  final int _fats;
  final int _servings;

  Food(
      {@required name,
      @required brand,
      @required calories,
      @required protein,
      @required carbs,
      @required fats,
      @required servings})
      : this._name = name,
        this._brand = brand,
        this._calories = calories,
        this._protein = protein,
        this._carbs = carbs,
        this._fats = fats,
        this._servings = servings;

  String get name => _name;

  String get brand => _brand;

  int get calories => _calories;

  int get protein => _protein;

  int get carbs => _carbs;

  int get fats => _fats;

  int get servings => _servings;
}
