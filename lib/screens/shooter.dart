import 'package:flutter/material.dart';

class Shooter extends StatefulWidget {
  const Shooter({super.key});

  @override
  State<Shooter> createState() => _ShooterState();
}

class _ShooterState extends State<Shooter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shooter Games'),),
    );
  }
}