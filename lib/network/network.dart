import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';

class Network{
  Future<WeatherForecastModel> getWeatherForecast({String? cityName}) async{
    var finalUrl = "http://api.openweathermap.org/data/2.5/forecast/daily?q=${cityName!}"
        "&appid=${Util.appId}&units=imperial";

    final response = await get(Uri.parse(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if(response.statusCode == 200){

      print("weather data: ${response.body}");

      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error getting weather forecast");
    }
  }

}