import 'package:flutter/material.dart';
import 'package:weather_app/env.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //Api key
  final _weatherService = WeatherService(Env().apiKey);

  //Fetch weather
  Weather? _currentWeather;

  _fecthWeather() async {
    //pegar a cidade atual
    final String cityName = await _weatherService.getCurrentCity();
    //pegar o clima

    try {
      final Weather currentWeather =
          await _weatherService.getCurrentWeather(cityName);

      setState(() {
        _currentWeather = currentWeather;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  //inicia o estado
  @override
  void initState() {
    super.initState();
    _fecthWeather();
  }

  //weather animation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do tempo'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(_currentWeather?.cityName ?? "Carregando ..."),
          Text('${_currentWeather?.temperature.round().toString()}°C'),
          Text(_currentWeather?.mainCondition ?? "Carregando ...")
        ]),
      ),
    );
  }
}
