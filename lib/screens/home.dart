import 'package:flutter/material.dart';
import 'package:ftp/screens/pc.dart';
import 'package:ftp/screens/shooter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      drawer: Drawer(
        backgroundColor: Colors.purple[200],
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ),
          ListTile(
            title: Text('PC Games'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PC()),
              );
            },
          ),
          ListTile(
            title: Text('Shooter Games'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shooter()),
              );
            },
          )
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          'Popular Games',
        ),
      ),
    );
  }
}
