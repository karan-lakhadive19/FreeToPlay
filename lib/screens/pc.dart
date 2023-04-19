import 'package:flutter/material.dart';

class PC extends StatefulWidget {
  const PC({super.key});

  @override
  State<PC> createState() => _PCState();
}

class _PCState extends State<PC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PC Games')),
    );
  }
}