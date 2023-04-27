// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ftp/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  String title;
  String genre;
  String thumbnail;

  String platform;
  String short_desc;
  String publisher;
  String release_date;
  String url;

  Details(
      {required this.title,
      required this.thumbnail,
      required this.release_date,
      required this.short_desc,
      required this.genre,
      required this.platform,
      required this.publisher,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(
              title,
              style:
                  GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w800),
            )),
        body: Container(
          // color: Colors.purple[200],
          child: ListView(
            children: [
              Container(child: Image.network(thumbnail)),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Release Date: " + release_date,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description: " + short_desc,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Genre: " + genre,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Platform: " + platform,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Publisher: " + publisher,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: Text(
                //   "Link: " + url,
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                // ),
                child: TextButton(
                  child: Text(url, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),),
                  onPressed: () async{
                    var myUrl = Uri.parse(url);
                    var urlLaunchable = await launchUrl(myUrl);
                    if(urlLaunchable) {
                      await launch(myUrl as String);
                    }else {
                      print('Cant be launched....');
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
