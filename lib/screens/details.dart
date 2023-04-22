import 'package:flutter/material.dart';
import 'package:ftp/screens/home.dart';

class Details extends StatelessWidget {
  String title;
  String genre;
  String thumbnail;

  String platform;
  String short_desc;
  String publisher;
  String release_date;
  String url;


   Details({required this.title,required this.thumbnail, required this.release_date, required this.short_desc, required this.genre, required this.platform, required this.publisher, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(
        children: [
          Text(title),
          Image.network(thumbnail),
          Text(release_date),
          Text(short_desc),
          Text(genre),
          Text(platform),
          Text(publisher),
          Text(url)
        ],
      )
    );
  }
}