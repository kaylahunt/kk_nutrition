// import 'package:firebase_database/firebase_database.dart';
// import 'package:kaylaknows_nutrition/services/database.dart';
import 'package:flutter/material.dart';
import 'package:kk_nutrition/screens/sign_up_page.dart';
import 'dart:async';

double tCalorie = 0;
double tCarbs = 0;
double tProtein = 0;
double tFat = 0;

//ignore: must_be_immutable
class MealLog extends StatefulWidget {
  String meal;
  MealLog({Key? key, required this.meal}) : super(key: key);

  @override
  _MealLogState createState() => _MealLogState();
}

class _MealLogState extends State<MealLog> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var buttonBound = (screenWidth / 20);
    var screenHeight = MediaQuery.of(context).size.height;
    var headerBound = (screenHeight / 24);

    return Column(
      children: <Widget>[
        // StreamBuilder(
        //   stream: userId.onValue,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (!snapshot.hasData) return const Text("There is no data");
        // return SingleChildScrollView(
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: headerBound / 2,
                  left: buttonBound,
                  right: buttonBound,
                  top: headerBound / 5),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: buttonBound / 2),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: headerBound / 2,
                              horizontal: buttonBound / 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Food",
                                  style: TextStyle(
                                      fontSize: headerBound / 2,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: buttonBound * 1.5),
                                Text(
                                  "Calories",
                                  style: TextStyle(
                                      fontSize: headerBound / 2,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: buttonBound * 2),
                                Text(
                                  "Carbs",
                                  style: TextStyle(
                                      fontSize: headerBound / 2,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: buttonBound * 2),
                                Text(
                                  "Protein",
                                  style: TextStyle(
                                      fontSize: headerBound / 2,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: buttonBound * 2),
                                Text(
                                  "Fat",
                                  style: TextStyle(
                                      fontSize: headerBound / 2,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Container(
                        //         height: 1,
                        //         width: 750,
                        //         decoration: const BoxDecoration(
                        //             color: Colors.black)),
                        //     for (var i = 0;
                        //         i < snapshot.data!.docs.length;
                        //         i++)
                        //       Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Row(
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.start,
                        //           children: <Widget>[
                        //             SizedBox(
                        //               width: 60,
                        //               child: Text(
                        //                 snapshot.data!.docs[i].id,
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //             const SizedBox(width: 50),
                        //             SizedBox(
                        //               width: 60,
                        //               child: Text(
                        //                 "${snapshot.data!.docs[i][snapshot.data!.docs[i].id]["Total Calories"]}",
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //             const SizedBox(width: 50),
                        //             SizedBox(
                        //               width: 60,
                        //               child: Text(
                        //                 "${snapshot.data!.docs[i][snapshot.data!.docs[i].id]["Carbohydrate"]}",
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //             const SizedBox(width: 50),
                        //             SizedBox(
                        //               width: 60,
                        //               child: Text(
                        //                 "${snapshot.data!.docs[i][snapshot.data!.docs[i].id]["Protein"]}",
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //             const SizedBox(width: 50),
                        //             SizedBox(
                        //               width: 60,
                        //               child: Text(
                        //                 "${snapshot.data!.docs[i][snapshot.data!.docs[i].id]["Fat"]}",
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //   ],
                        // ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
