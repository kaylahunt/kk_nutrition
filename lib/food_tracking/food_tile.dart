import 'package:flutter/material.dart';
import 'package:kk_nutrition/food_tracking/food.dart';
import 'package:kk_nutrition/screens/food_log.dart';
import '../constants.dart';

//ignore: must_be_immutable
class FoodTile extends StatelessWidget {
  final String food_name;
  final String food_brand;
  final String nxid;
  final String meal;

  const FoodTile(this.food_name, this.food_brand, this.nxid, this.meal,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => FoodLog(
                  food_name: food_name, nxid: nxid, meal: meal, servings: 1)));
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Constants.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Builder(
            builder: ((context) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    food_name,
                    style: TextStyle(
                      color: Constants.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    food_brand,
                    style: TextStyle(
                      color: Constants.secondary.withOpacity(0.7),
                    ),
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
