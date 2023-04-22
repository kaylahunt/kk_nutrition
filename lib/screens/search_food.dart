import 'package:kk_nutrition/screens/search_results.dart';
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
    var screenBound = MediaQuery.of(context).size.width * 0.7;
    var heightBound = MediaQuery.of(context).size.height * 0.5;
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
            Align(
              alignment: Alignment.topCenter,
              heightFactor: heightBound * .5,
              child: Text(
                "$meal",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: heightBound / 4),
              ),
            ),
            Align(
              alignment: Alignment.center,
              heightFactor: 25,
              child: Container(
                width: screenBound,
                height: 52,
                decoration: BoxDecoration(
                  color: Constants.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Search for food',
                  ),
                  onChanged: (value) {
                    searchText = value;
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                child: const Text("Enter"),
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
