import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ftp/screens/battleRoyale.dart';
import 'package:ftp/screens/browser.dart';
import 'package:ftp/screens/details.dart';
import 'package:ftp/screens/pc.dart';
import 'package:ftp/screens/shooter.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: Colors.white,
        drawer: Drawer(
            backgroundColor: Colors.black87,
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header', style: TextStyle(color: Colors.white),),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 36, 35, 35),
                  child: ListTile(
                    title: Text('PC Games', style: TextStyle(color: Colors.white),),
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
                  color: Color.fromARGB(255, 36, 35, 35),
                  child: ListTile(
                    title: Text('Browser Games', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Browser()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Color.fromARGB(255, 36, 35, 35),
                  child: ListTile(
                    title: Text('Battle Royale Games', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BattleRoyale()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Color.fromARGB(255, 36, 35, 35),
                  child: ListTile(
                    title: Text('Racing Games', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shooter()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Color.fromARGB(255, 36, 35, 35),
                  child: ListTile(
                    title: Text('Shooter Games', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shooter()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Color.fromARGB(255, 36, 35, 35),
                  child: ListTile(
                    title: Text('Survival Games', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shooter()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Color.fromARGB(255, 36, 35, 35),
                  child: ListTile(
                    title: Text('Strategy Games', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shooter()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Color.fromARGB(255, 36, 35, 35),
                  child: ListTile(
                    title: Text('Open World Games', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shooter()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            )),
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "Popular Games",
              style:
                  GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w800),
            )),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              color: Colors.black87,
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    title: listResponse[index]['title'],
                                    thumbnail: listResponse[index]['thumbnail']
                                        .toString(),
                                    release_date: listResponse[index]
                                            ['release_date']
                                        .toString(),
                                    short_desc: listResponse[index]
                                            ['short_description']
                                        .toString(),
                                    genre: listResponse[index]['genre'],
                                    platform: listResponse[index]['platform']
                                        .toString(),
                                    publisher: listResponse[index]['publisher']
                                        .toString(),
                                    url: listResponse[index]['game_url']
                                        .toString(),
                                  )),
                        );
                        print(listResponse[index]['url'].toString());
                      },
                      child: Image.network(listResponse[index]["thumbnail"])),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Text(
                  listResponse[index]["title"].toString(),
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
                )),
                SizedBox(
                  height: 20,
                )
              ],
            ));
          },
          itemCount: listResponse.length,
        ));
  }
}
