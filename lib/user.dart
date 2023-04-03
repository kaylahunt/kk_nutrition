import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kk_nutrition/services/database.dart';

class User {
  String _fullName;
  String _username;
  String _emailAddress;
  String _password;
  late DatabaseReference _id;

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
  DatabaseReference get id => _id;

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

  set id(DatabaseReference id) {
    _id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      _username: {
        'user_info': {
          'name': _fullName,
          'email': _emailAddress,
          'password': _password
        },
        'Friday': 'breakfast',
      }
    };
  }
}
