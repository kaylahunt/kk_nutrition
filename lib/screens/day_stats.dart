// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:hexcolor/hexcolor.dart';
// import 'package:kaylaknows_nutrition/screens/sign_in_page.dart';

import '../app_theme.dart';
// Need the auth stuff

double alldatacalories = 0;
double alldatacarbo = 0;
double alldataprotein = 0;
double alldatafat = 0;
double calspercent = .16;
double carbspercent = .50;
double proteinpercent = .25;
double fatpercent = .77;
//late User user1;
//late String eatenCalorie;

class DayStats extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const DayStats({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  _DayStatsState createState() => _DayStatsState();
}

class _DayStatsState extends State<DayStats> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //user1 = auth.currentUser!;

    var screenWidth = MediaQuery.of(context).size.width;
    var bound = (screenWidth / 4);
    var screenHeight = MediaQuery.of(context).size.height;
    var bound2 = (screenHeight / 8);

    Widget _calorieDisplay(int score) {
      return Container(
        height: bound2,
        width: bound,
        decoration: const BoxDecoration(
          color: Color(0xff5FA55A),
          shape: BoxShape.circle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(score.toString(),
                style: TextStyle(
                  fontSize: bound2 / 3,
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w500,
                )),
            Text('Health Score',
                style: TextStyle(
                  fontSize: bound2 / 8,
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      );
    }

    return Stack(children: <Widget>[
      Container(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * .05,
            right: screenWidth * .05,
            top: bound2 / 2,
          ),
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Calories',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: bound2 / 5,
                      letterSpacing: -0.2,
                      color: AppTheme.darkText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      height: 4,
                      width: bound * 2,
                      decoration: BoxDecoration(
                        color: HexColor('#87A0E5').withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: (calspercent * bound) > bound
                                ? bound * 2
                                : (calspercent * bound) < 0
                                    ? 0
                                    : calspercent * bound * 2,
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                HexColor('#87A0E5'),
                                HexColor('#87A0E5').withOpacity(0.5),
                              ]),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      (alldatacalories).toStringAsFixed(0) + 'kcal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w600,
                        fontSize: bound2 / 6,
                        color: AppTheme.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _calorieDisplay(85),
            )
          ]),
        ),
      ),
      Container(
          child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * .05,
            right: screenWidth * .05,
            top: bound2 * 2,
            bottom: bound2 / 2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Carbs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      fontSize: bound2 / 5,
                      letterSpacing: -0.2,
                      color: AppTheme.darkText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      height: 4,
                      width: bound,
                      decoration: BoxDecoration(
                        color: HexColor('#87A0E5').withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: (carbspercent * bound) > bound
                                ? bound
                                : (carbspercent * bound) < 0
                                    ? 0
                                    : carbspercent * bound,
                            height: 4,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                HexColor('#87A0E5'),
                                HexColor('#87A0E5').withOpacity(0.5),
                              ]),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      (alldatacarbo).toStringAsFixed(0) + 'g',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppTheme.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Protein',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: bound2 / 5,
                          letterSpacing: -0.2,
                          color: AppTheme.darkText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          height: 4,
                          width: bound,
                          decoration: BoxDecoration(
                            color: HexColor('#F56E98').withOpacity(0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: (proteinpercent * bound) > bound
                                    ? bound
                                    : (proteinpercent * bound) < 0
                                        ? 0
                                        : proteinpercent * bound,
                                height: 4,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    HexColor('#F56E98').withOpacity(0.1),
                                    HexColor('#F56E98'),
                                  ]),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          (alldataprotein).toStringAsFixed(0) + 'g',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w600,
                            fontSize: bound2 / 6,
                            color: AppTheme.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Fat',
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: bound2 / 5,
                          letterSpacing: -0.2,
                          color: AppTheme.darkText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0, top: 4),
                        child: Container(
                          height: 4,
                          width: bound,
                          decoration: BoxDecoration(
                            color: HexColor('#F1B440').withOpacity(0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: (fatpercent * bound) > bound
                                    ? bound
                                    : (fatpercent * bound) < 0
                                        ? 0
                                        : fatpercent * bound,
                                height: 4,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    HexColor('#F1B440').withOpacity(0.1),
                                    HexColor('#F1B440'),
                                  ]),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          (alldatafat).toStringAsFixed(0) + 'g',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w600,
                            fontSize: bound2 / 6,
                            color: AppTheme.grey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ))
    ]);
  }
}
