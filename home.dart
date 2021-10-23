// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String backGroundImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color backGroundColor =
        data['isDayTime'] ? Colors.lightBlue : Colors.indigo.shade700;

    return Scaffold(
        backgroundColor: backGroundColor,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/$backGroundImage'),
                        fit: BoxFit.cover)),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        TextButton.icon(
                          icon: Icon(
                            Icons.edit_location,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Edit Location',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            dynamic result =
                                await Navigator.pushNamed(context, '/location');
                            setState(() {
                              data = {
                                'time': result['time'],
                                'location': result['location'],
                                'flag': result['flag'],
                                'isDayTime': result['isDayTime']
                              };
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              data['location'],
                              style: TextStyle(
                                  fontSize: 28,
                                  letterSpacing: 2,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          data['time'],
                          style: TextStyle(fontSize: 66.0, color: Colors.white),
                        ),
                      ],
                    )))));
  }
}
