import 'package:flutter/material.dart';
import 'package:weather_app/env.dart';

class WeatherUpdateButton extends StatelessWidget {
  WeatherUpdateButton({Key? key}) : super(key: key);

  final apiKey = Env().apiKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          print(apiKey);
        },
        child: const Text('Atualizar'),
      ),
    );
  }
}
