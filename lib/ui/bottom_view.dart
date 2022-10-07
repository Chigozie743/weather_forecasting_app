import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/ui/forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel>snapshot, BuildContext context){
  var forecastList = snapshot.data!.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        "7-Days Weather Forecast".toUpperCase(),
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black87,
          fontWeight: FontWeight.w600
        ),
      ),

      Container(
        height: 190,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 8.0,),
          itemCount: forecastList!.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 160.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.seaBlue,
                ),
              ),
              child: forecastCard(snapshot, index),
            ),
          ),
        ),
      ),
    ],
  );
}