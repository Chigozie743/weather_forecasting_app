import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/network/network.dart';
import 'package:weather_forecast_app/ui/bottom_view.dart';
import 'package:weather_forecast_app/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String? _cityName = "Lagos";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);

    // forecastObject.then((weather) {
    //   print(weather.city!.country);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradientColors.dimBlue,
          ),
        ),
       child: ListView(
         children: [
           textFieldView(),
           Container(

             child: FutureBuilder<WeatherForecastModel> (
               future: forecastObject,
               builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){
                 if(snapshot.hasData){
                   return Column(
                     children: <Widget>[
                       midView(snapshot),
                       bottomView(snapshot, context),
                     ],
                   );
                  }else{
                    return Container(
                      child: const Center(
                        child: CircularProgressIndicator(),
                    ),
                   );
                }
              }
            ),
           ),
         ],
       ),
     ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: TextField(

            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: "Enter City Name",
              prefixIcon: const Icon(Icons.search, color: Colors.white,),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1.0,
                    color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.brown,
                  width: 1.0,
                ),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              // ),
              contentPadding: const EdgeInsets.all(8.0),
            ),
            onSubmitted: (value) {
              setState(() {
                _cityName = value;
                forecastObject = getWeather(cityName: _cityName);
              });
            },
          ),
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String? cityName}) =>
      new Network().getWeatherForecast(cityName: _cityName);
}
