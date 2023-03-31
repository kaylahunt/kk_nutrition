import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kaylaknows_nutrition/services/database.dart';

class User {
  String _fullName;
  String _username;
  String _emailAddress;
  String _password;
  //Set dates_entered = {};

  User(
      {@required fullname,
      @required username,
      @required emailAddress,
      @required password})
      : _fullName = fullname,
        _username = username,
        _emailAddress = emailAddress,
        _password = password;

  String get username => _username;
  String get emailAddress => _emailAddress;
  String get password => _password;
  String get fullName => _fullName;

  set username(String un) {
    _username = un;
  }

  set emailAddress(String ea) {
    _emailAddress = ea;
  }

  set password(String pass) {
    _password = pass;
  }

  set fullName(String name) {
    _fullName = name;
  }

  Map<String, dynamic> toJson() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return {
      _username: {
        'user_info': {
          'name': _fullName,
          'email': _emailAddress,
          'password': _password
        },
        date.toString(): {},
      }
    };
  }
}
