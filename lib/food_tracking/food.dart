import 'package:flutter/material.dart';

class Food {
  final String _name;
  final String _brand;
  final double _calories;
  final double _protein;
  final double _carbs;
  final double _fats;
  final double _satFat;
  final double _sodium;
  final double _sugar;
  final double _servings;
  final double _fiber;
  final double _potassium;

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
    @required fiber,
    @required potassium,
  })  : this._name = name,
        this._brand = brand,
        this._calories = calories,
        this._protein = protein,
        this._carbs = carbs,
        this._fats = fats,
        this._servings = servings,
        this._satFat = satFats,
        this._sodium = sodium,
        this._sugar = sugar,
        this._fiber = fiber,
        this._potassium = potassium;

  String get name => _name;

  String get brand => _brand;

  double get calories => _calories;

  double get protein => _protein;

  double get carbs => _carbs;

  double get fats => _fats;

  double get servings => _servings;

  double get satFats => _satFat;

  double get sodium => _sodium;

  double get sugar => _sugar;

  double get fiber => _fiber;

  double get potassium => _potassium;

  Map<String, double> foodToJson() {
    return {
      'calories': _calories,
      'proteins': _protein,
      'carbs': _carbs,
      'fats': _fats,
      'servings': _servings
    };
  }
}
