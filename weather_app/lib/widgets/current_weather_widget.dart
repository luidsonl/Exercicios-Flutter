import 'package:flutter/material.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final dynamic temperature;
  final dynamic description;
  final dynamic iconUrl;

  const CurrentWeatherWidget(
      {super.key, this.temperature, this.description, this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        iconUrl != null
            ? Image.network(
                iconUrl,
                width: 200,
                height: 200,
              )
            : Image.asset(
                'assets/loading.png',
                width: 50,
                height: 50,
              ),
        Text('${temperature?.round().toString()}°C'),
        Text(description ?? "Carregando ..."),
      ]),
    );
  }
}
