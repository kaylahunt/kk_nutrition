import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kk_nutrition/food_tracking/food.dart';
import '../../constants.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../food_tracking/food_tile.dart';

late Response response;
var dio = Dio();

class SearchResult extends StatefulWidget {
  String searchText;
  final String meal;
  SearchResult({Key? key, required this.searchText, required this.meal})
      : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  String searchText = "";
  String meal = "";
  var results = [];
  List<Widget> tiles = [];

  var searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Future<List> getsmthg() async {
    searchText = widget.searchText;
    meal = widget.meal;
    var response = httprequest(searchText);
    print("Here");
    results = await response;
    print("There");
    tiles = [];
    for (var item in results) {
      tiles.add(FoodTile(item[0], item[1], item[2], meal));
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    print("H?EEELLLOOO");
    return FutureBuilder(
      future: getsmthg(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(tiles);
          return Scaffold(
              appBar: AppBar(
                title: const Text("Search results"),
                backgroundColor: Colors.cyan,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Find Your Food',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 52,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Constants.primary,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              controller: searchController..text = searchText,
                              decoration: const InputDecoration.collapsed(
                                hintText: 'Search for food',
                              ),
                              onChanged: (value) {
                                searchText = value;
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: MaterialButton(
                              onPressed: () {
                                research(searchText);
                              },
                              color: Colors.cyan,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text("Next"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: tiles,
                    ),
                  ],
                ),
              ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  void research(String text) {
    results = [];
    setState(() {
      widget.searchText = text;
    });
  }
}

Future<List> httprequest(String name) async {
  dio.options.headers['content'] = "application/json";
  dio.options.headers['Content-Type'] = "application/x-www-form-urlencoded";
  dio.options.headers['x-app-id'] = "6fdef0e0";
  dio.options.headers["x-app-key"] = "e0d0ffe1141be81087401c46402ff78b";

  List results = [];
  try {
    response = await dio.post(
      'https://trackapi.nutritionix.com/v2/search/instant',
      data: {
        'query': name,
        "common": true,
        "branded": true,
        "branded_food_name_only": true
      },
    );
    print(response);
    if (response.statusCode == 200) {
      print(response.data);
      for (var food in response.data['branded']) {
        String foodName = (food['food_name'] ?? name).toString();
        String foodBrand = (food['brand_name'] ?? "None").toString();
        String nxid = (food['nix_item_id'] ?? "-1").toString();
        results.add([foodName, foodBrand, nxid]);
      }
      for (var food in response.data['common']) {
        String foodName = (food['food_name'] ?? name).toString();
        String foodBrand = (food['brand_name'] ?? "None").toString();
        results.add([foodName, foodBrand, "-1"]);
      }
    }
    return results;
  } catch (e) {
    print(e);
    Fluttertoast.showToast(
        msg: 'Food not found. Try again', gravity: ToastGravity.TOP);
    return results;
  }
}
