import 'package:first_app/gallery-data.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import 'package:first_app/weather-form.dart';
import './camera.dart';
import './gallery.dart';


class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new DrawerHeader(
            child: Center(
              child: CircleAvatar(
                radius: 50,backgroundImage: AssetImage('images/3.jpeg'),
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.lightBlue, Colors.white])),
          ),
          ListTile(
              title: Text(
                'Quiz', style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz(5)));
              }),
          ListTile(
              title: Text(
                'Weather',style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherForm()));
              }),
          ListTile(
              title: Text(
                'Gallery', style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Gallery()));
              }),
          ListTile(
              title: Text(
                'Camera', style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CameraPage()));
              }),
        ],
      ),
    );
  }
}
