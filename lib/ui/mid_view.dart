import 'package:flutter/material.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/convert_icon.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data!.list;
  var city = snapshot.data!.city!.name;
  var country = snapshot.data!.city!.country;
  var formattedDate = DateTime.fromMillisecondsSinceEpoch((forecastList![0].dt!) * 1000);

  var forecast = forecastList[0];


  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$city, $country",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          Text(
            Util.getFormattedDate(formattedDate),
            style: const TextStyle(
              fontSize: 15.0,
            ),
          ),

          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(
              weatherDescription: forecastList[0].weather![0].main,
              color: Colors.pinkAccent,
              size: 198.0
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${forecastList[0].temp!.day!.toStringAsFixed(0)} °F",
                  style: const TextStyle(
                    fontSize: 34.0,
                  ),
                ),
                const SizedBox(width: 10.0,),
                Text(
                  "${forecast.weather![0].description!.toUpperCase()}",
                  style: const TextStyle(
                    color: Colors.brown,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${forecast.speed!.toStringAsFixed(1)} mi/h",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: 5.0,),
                      const Icon(
                        FontAwesomeIcons.wind,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          "${forecast.humidity!.toStringAsFixed(1)} %",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: 5.0,),
                      const Icon(
                        FontAwesomeIcons.solidFaceGrinBeamSweat,
                        size: 20.0,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          "${forecast.temp!.max!.toStringAsFixed(0)} °F",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: 5.0,),
                      const Icon(
                        FontAwesomeIcons.temperatureHigh,
                        size: 20.0,
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  return midView;

}