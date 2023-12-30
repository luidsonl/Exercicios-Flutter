import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/env.dart';
import 'package:weather_app/models/coordinates_model.dart';
import 'package:weather_app/models/forecast_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/city_name.dart';
import 'package:weather_app/widgets/city_search_form.dart';
import 'package:weather_app/widgets/container_all.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/forecast_list_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherService _weatherService = WeatherService(Env().apiKey);

  Weather? _currentWeather;
  Forecast? _weatherForecast;
  bool _showWeather = false;
  Coordinates? location;

  _updateCurrentLocation() async {
    final Position currentPosition = await _weatherService.getCurrentPosition();

    setState(() {
      location = Coordinates(
          lat: currentPosition.latitude, lon: currentPosition.longitude);
    });
    _fecthWeather();
  }

  _updateCityLocation(city) async {
    final Coordinates cityLocation = await _weatherService.getCityBySearch(
        cityName: city, apiKey: Env().apiKey);

    setState(() {
      location = cityLocation;
    });

    _fecthWeather();
  }

  _fecthWeather() async {
    try {
      final Weather currentWeather =
          await _weatherService.getCurrentWeather(location!.lat, location!.lon);

      setState(() {
        _currentWeather = currentWeather;
      });
    } catch (e) {
      throw Exception(e);
    }
    try {
      final Forecast weatherForecast = await _weatherService.getWeatherForecast(
          location!.lat, location!.lon);

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
    _initLocalWeather();
  }

  //Atualiza o clima do local atual
  void _initLocalWeather() {
    setState(() {
      _showWeather = true;
    });
    _updateCurrentLocation();
  }

  //Atualiza o clima do local atual
  void _searchCityWeather(city) {
    setState(() {
      _showWeather = true;
    });
    _updateCityLocation(city);
  }

  @override
  Widget build(BuildContext context) {
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
                        CitySearchForm(
                          onSearch: (String value) {
                            _searchCityWeather(value);
                          },
                        ),
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
            ],
          ),
        ));
  }
}
