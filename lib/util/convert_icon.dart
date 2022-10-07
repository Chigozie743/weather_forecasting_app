import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

Widget getWeatherIcon({String? weatherDescription, Color? color, double? size}){
  switch(weatherDescription){
    case "Clear":
      {
        return Container(
          // height: 150,
          // width: 400,
          child: Center(
            child: Lottie.asset(
              "assets/animations/2072-sun-animation.json",
              height: 200,
              width: 200,
            ),
          ),
        );
      }
      break;

    case "Cloud":
      {
        return Container(
          height: 50,
          width: 50,
          child: Center(
            child: Lottie.asset(
                "assets/animations/50651-cloudy.json"
            ),
          ),
        );
      }
      break;

    case "Rain":
      {
        return Container(
          // height: 400,
          // width: 400,
          child: Center(
            child: Lottie.asset(
                "assets/animations/115687-rain.json",
                height: 220,
              width: 220,
            ),
          ),
        );
      }
      break;

    case "Snow":
      {
        return Container(
          height: 50,
          width: 50,
          child: Center(
            child: Lottie.asset(
                "assets/animations/64966-snow-icon.json"
            ),
          ),
        );
      }
      break;

    default:
      {
        return Container(
          height: 200,
          width: 400,
          child: Center(
            child: Lottie.asset(
                "assets/animations/2115-suncloud.json"
            ),
          ),
        );
        // return Icon(
        //   Icons.wb_sunny_rounded,
        //   //FontAwesomeIcons.sun,
        //   color: Colors.amber,
        //   size: size,
        // );
      }
      break;
  }
}