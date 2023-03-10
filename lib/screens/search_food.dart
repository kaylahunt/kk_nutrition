import 'package:kaylaknows_nutrition/screens/search_results.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import '../constants.dart';

class SearchBar extends StatefulWidget {
  final String meal;
  const SearchBar({Key? key, required this.meal}) : super(key: key);
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String searchText = "";
  String meal = "";

  @override
  void initState() {
    super.initState();
    searchText = "";
    meal = widget.meal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add food for $meal"),
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
        body: Stack(
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
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => SearchResult(
                              searchText: searchText, meal: meal)));
                },
                color: Colors.cyan,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ));
  }
}
