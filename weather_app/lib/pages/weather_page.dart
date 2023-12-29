import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/env.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/city_name.dart';
import 'package:weather_app/widgets/container_all.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/forecast_list_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //Api key
  final WeatherService _weatherService = WeatherService(Env().apiKey);

  //Fetch weather
  Weather? _currentWeather;
  Forecast? _weatherForecast;
  bool _showWeather = false;

  _fecthWeather() async {
    //pegar a cidade atual
    final Position currentPosition = await _weatherService.getCurrentPosition();
    //pegar o clima

    try {
      final Weather currentWeather = await _weatherService.getCurrentWeather(
          currentPosition.latitude, currentPosition.longitude);

      setState(() {
        _currentWeather = currentWeather;
      });
    } catch (e) {
      throw Exception(e);
    }
    try {
      final Forecast weatherForecast = await _weatherService.getWeatherForecast(
          currentPosition.latitude, currentPosition.longitude);

      setState(() {
        _weatherForecast = weatherForecast;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  //inicia o estado
  @override
  void initState() {
    super.initState();
  }

  //Ação do botão
  void updateLocalWeather() {
    setState(() {
      _showWeather = true;
    });
    _fecthWeather();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> myList = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Previsão do tempo'),
        ),
        body: ContainerAll(
          child: Column(
            children: [
              _showWeather
                  ? Column(
                      children: [
                        CityName(
                          cityName: _currentWeather?.cityName,
                        ),
                        CurrentWeatherWidget(
                          temperature: _currentWeather?.temperature,
                          description: _currentWeather?.description,
                          iconUrl: _currentWeather?.iconUrl,
                        ),
                        ForecastListWidget(forecast: _weatherForecast)
                      ],
                    )
                  : Container(),
              TextButton(
                  onPressed: updateLocalWeather,
                  child: const Text('Pegar clima local'))
            ],
          ),
        ));
  }
}
