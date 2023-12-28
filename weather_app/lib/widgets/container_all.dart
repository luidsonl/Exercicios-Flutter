import 'package:flutter/material.dart';

class ContainerAll extends StatelessWidget {
  final Widget child;
  const ContainerAll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: child,
    );
  }
}
