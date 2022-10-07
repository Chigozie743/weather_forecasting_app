import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/convert_icon.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot, int index){
  var forecastList = snapshot.data!.list;
  var dayOfWeek = "";

  DateTime date = DateTime.fromMillisecondsSinceEpoch((forecastList![index].dt!) * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            dayOfWeek,
          style: const TextStyle(
              fontWeight: FontWeight.w700
          ),
        ),
      )),

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white30,
            child: getWeatherIcon(weatherDescription: forecastList[index].weather![0].main),
          ),

          const SizedBox(width: 10.0,),

          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                        "${forecastList[index].temp!.min!.toStringAsFixed(0)} °F",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 17.0,
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                        "${forecastList[index].temp!.max!.toStringAsFixed(0)} °F",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.solidArrowAltCircleUp,
                    color: Colors.white,
                    size: 17.0,
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                        "${forecastList[index].humidity!.toStringAsFixed(0)} %",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.solidFaceGrinBeamSweat,
                    color: Colors.white,
                    size: 17.0,
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                        "${forecastList[index].speed!.toStringAsFixed(1)} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.wind,
                    color: Colors.white,
                    size: 17.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

    ],
  );

}