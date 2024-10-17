import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //API KEY
  final _weatherService = WeatherService('5aa9d2e619e94bc199e152415241710');
  Weather? _weather;

  //FETCH THE CURRENT WEATHER
  _fetchWeather() async {
    //Current city
    String cityName = await _weatherService.getCurrentCity();

    //Weather for the city
    try {
      final weather = await _weatherService.getWeather(cityName);

      setState(() {
        _weather = weather;
      });
    }

    //Errors
    catch (e) {
      print(e);
    }
  }

  //WEATHER ANIMATION

  //Initstate
  @override
  void initState() {
    super.initState();

    //Fetch weather on startup

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //City Name
            Text(_weather?.cityName ?? "loading city.."),

            //Temperature
            Text('${_weather?.temperature.round()}C'),
          ],
        ),
      ),
    );
  }
}
