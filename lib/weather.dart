import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  String city;
  Weather(this.city);
  @override
  _WeatherState createState() => _WeatherState();
}
class _WeatherState extends State<Weather> {

  List<dynamic> weatherData;
  getData(url){
    http.get(
        Uri.encodeFull(url), headers: {'accept':'application/json'}
    ).then((resp){
      setState((){
        weatherData=json.decode(resp.body)['list'];
      });
    }).catchError((err){
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    String url='http://openweathermap.org/data/2.5/forecast?q=${this.widget.city}&appid=e75c324ae469a8ec0e833f647216f399';
    print(url);
    this.getData(url);
  }

  @override
  Widget build(BuildContext context) {
    //List<String> listData = getListData();
    String url='http://openweathermap.org/data/2.5/forecast?q=${this.widget.city}&appid=e75c324ae469a8ec0e833f647216f399';
    print(url);
    this.getData(url);
    return Scaffold(
        appBar: AppBar(title: Text('${widget.city}'), backgroundColor:
        Colors.lightBlue,),
        body:
        (weatherData == null) ? Center(child: CircularProgressIndicator()) :
        ListView.builder(
            itemCount: weatherData == null ? 0 : weatherData.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'images/${weatherData[index]['weather'][0]['main'].toLowerCase()}.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("${new DateFormat('E-dd/MM/yyyy').format(
                                    DateTime.fromMicrosecondsSinceEpoch(
                                        weatherData[index]['dt'] * 1000000))}",
                                    style: TextStyle(fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Text("${new DateFormat('HH:mm').format(
                                    DateTime.fromMicrosecondsSinceEpoch(
                                        weatherData[index]['dt'] *
                                            1000000))} | ${weatherData[index]['weather'][0]['main']}",
                                    style: TextStyle(fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text("${weatherData[index]['main']['temp'].round()} °C",
                        style: TextStyle(fontSize: 20, color:
                        Colors.white, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              );
            })
    );
  }
}