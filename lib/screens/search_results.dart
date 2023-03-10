import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaylaknows_nutrition/food_tracking/food.dart';
import '../../constants.dart';
import 'package:dio/dio.dart';

import '../food_tracking/food_tile.dart';

late Response response;
var dio = Dio();

class SearchResult extends StatefulWidget {
  final String searchText;
  final String meal;
  const SearchResult({Key? key, required this.searchText, required this.meal})
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
    getsmthg();
  }

  Future<void> getsmthg() async {
    searchText = widget.searchText;
    meal = widget.meal;
    var response = httprequest(searchText);
    results = await response;
    for (var item in results) {
      tiles.add(FoodTile(item, meal));
    }
  }

  dynamic dataList;
  @override
  Widget build(BuildContext context) {
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
            children: [
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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: tiles,
                  );
                },
              ),
              const SizedBox(height: 80),
            ],
          ),
        ));
  }

  void research(String text) {
    results = [];
    setState(() {
      searchText = text;
      meal = meal;
    });
  }
}

Future<List> httprequest(String name) async {
  dio.options.headers['x-app-id'] = "6fdef0e0";
  dio.options.headers["x-app-key"] = "e0d0ffe1141be81087401c46402ff78b";
  List results = [];
  try {
    response = await dio.post(
        'https://trackapi.nutritionix.com/v2/natural/nutrients',
        data: {'query': name});
    if (response.statusCode == 200) {
      for (var food in response.data['foods']) {
        Food entry = Food(
            name: food['food_name'].toString(),
            brand: food['brand_name'].toString(),
            calories: food['nf_calories'],
            protein: food['nf_protein'],
            carbs: food['nf_carbohydrate'],
            fats: food['nf_total_fat'],
            servings: 1);
        results.add(entry);
      }
    }
    return results;
  } catch (e) {
    Fluttertoast.showToast(
        msg: 'Food not found. Try again', gravity: ToastGravity.TOP);
    return results;
  }
}
