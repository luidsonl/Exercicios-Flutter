import 'package:flutter/material.dart';
import 'package:weather_app/widgets/container_all.dart';
import 'package:weather_app/widgets/weather_update_button.dart';

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Previsão do tempo'),
        ),
        body: ContainerAll(
          child: Column(children: [WeatherUpdateButton()]),
        ));
  }
}
