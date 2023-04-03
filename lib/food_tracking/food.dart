import 'package:flutter/material.dart';

class Food {
  final String _name;
  final String _brand;
  final int _calories;
  final int _protein;
  final int _carbs;
  final int _fats;
  final int _satFat;
  final int _sodium;
  final int _sugar;
  final int _servings;

  Food({
    @required name,
    @required brand,
    @required calories,
    @required protein,
    @required carbs,
    @required fats,
    @required servings,
    @required satFats,
    @required sodium,
    @required sugar,
  })  : this._name = name,
        this._brand = brand,
        this._calories = calories,
        this._protein = protein,
        this._carbs = carbs,
        this._fats = fats,
        this._servings = servings,
        this._satFat = satFats,
        this._sodium = sodium,
        this._sugar = sugar;

  String get name => _name;

  String get brand => _brand;

  int get calories => _calories;

  int get protein => _protein;

  int get carbs => _carbs;

  int get fats => _fats;

  int get servings => _servings;

  int get satFats => _satFat;

  int get sodium => _sodium;

  int get sugar => _sugar;

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
