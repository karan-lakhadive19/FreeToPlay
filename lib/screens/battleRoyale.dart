import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'details.dart';

class BattleRoyale extends StatefulWidget {
  const BattleRoyale({super.key});

  @override
  State<BattleRoyale> createState() => _BattleRoyaleState();
}

String stringResponse = ' ';
List listResponse = [];

class _BattleRoyaleState extends State<BattleRoyale> {

  Future apicall() async {
    http.Response response;
    var url = Uri.parse('https://www.freetogame.com/api/games?category=battle-royale');
    response = await http.get(url, headers: {
      'X-RapidAPI-Key': '6acab100c1msh64dc92d18064a50p13562fjsnc03cefd2f0c3',
      'X-RapidAPI-Host': 'free-to-play-games-database.p.rapidapi.com',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST,OPTIONS',
      'Access-Control-Allow-Headers':
          'Origin,Content-Type,X-RapidAPI-Key,X-RapidAPI-Host',
      'Access-Control-Allow-Credentials': 'true'
    });
    if(response.statusCode==200) {
      setState(() {
        stringResponse = response.body;
        listResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Battle Royale Games'), centerTitle: true,backgroundColor: Colors.black,),
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
        )
    );
  }
}
