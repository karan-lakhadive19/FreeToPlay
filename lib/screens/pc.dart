import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ftp/screens/details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class PC extends StatefulWidget {
  const PC({super.key});

  @override
  State<PC> createState() => _PCState();
}

String stringResponse = ' ';
List listResponse = [];

class _PCState extends State<PC> {
  Future apicall() async {
    http.Response response;
    var url = Uri.parse('https://www.freetogame.com/api/games?platform=pc');

    response = await http.get(url, headers: {
      'X-RapidAPI-Key': '6acab100c1msh64dc92d18064a50p13562fjsnc03cefd2f0c3',
      'X-RapidAPI-Host': 'free-to-play-games-database.p.rapidapi.com',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST,OPTIONS',
      'Access-Control-Allow-Headers':
          'Origin,Content-Type,X-RapidAPI-Key,X-RapidAPI-Host',
      'Access-Control-Allow-Credentials': 'true'
    });

    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        listResponse = json.decode(response.body);
        // print(stringResponse);
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('PC Games',style:
                  GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
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
