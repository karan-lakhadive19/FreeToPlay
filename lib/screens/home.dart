import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ftp/screens/details.dart';
import 'package:ftp/screens/pc.dart';
import 'package:ftp/screens/shooter.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String stringResponse = ' ';

List listResponse = [];

class _HomePageState extends State<HomePage> {
  Future apicall() async {
    try {
      http.Response response;
      var url =
          Uri.parse('https://www.freetogame.com/api/games?sort-by=popularity');
      response = await http.get(url, headers: {
        'X-RapidAPI-Key': '6acab100c1msh64dc92d18064a50p13562fjsnc03cefd2f0c3',
        'X-RapidAPI-Host': 'free-to-play-games-database.p.rapidapi.com',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'POST,OPTIONS',
        'Access-Control-Allow-Headers':
            'Origin,Content-Type,X-RapidAPI-Key,X-RapidAPI-Host',
        'Access-Control-Allow-Credentials': 'true'
      });
      // print(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        setState(() {
          stringResponse = response.body;

          listResponse = json.decode(response.body);
        });
      }
    } catch (e) {
      print(e);
    }

    // print(response);
  }

  @override
  void initState() {
    super.initState();
    apicall();
  }

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
                Container(
                  color: Colors.red,
                  child: ListTile(
                    title: Text('PC Games'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PC()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.red,
                  child: ListTile(
                    title: Text('Shooter Games'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shooter()),
                      );
                    },
                  ),
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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Details()),
                        );
                      },
                      child: Image.network(listResponse[index]["thumbnail"])),
                ),
                Container(child: Text(listResponse[index]["title"].toString()))
              ],
            ));
          },
          itemCount: listResponse.length,
        ));
  }
}
