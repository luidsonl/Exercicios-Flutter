import 'package:flutter/material.dart';

class ContainerAll extends StatelessWidget {
  final Widget child;
  const ContainerAll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.5),
            borderRadius: BorderRadius.circular(20)),
        child: child,
      ),
    );
  }
}
