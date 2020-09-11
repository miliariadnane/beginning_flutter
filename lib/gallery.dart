import 'package:first_app/gallery-data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.deepOrange, title: Text('${keyword}')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Key word'),
              onChanged: (value) {
                setState(() {
                  this.keyword = value;
                });
              },
              onSubmitted: (value) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GalleryData(value)));
              },
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GalleryData(this.keyword)));
                },
                color: Colors.deepOrange,
                textColor: Colors.white,
                child: Text('Get Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
