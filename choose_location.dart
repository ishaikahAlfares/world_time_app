import 'package:flutter/material.dart';
import 'package:world_time/services/WorldTimeClass.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Cairo', Location: 'Cairo', flag: 'cairo.png'),
    WorldTime(
        url: 'America/New_York', Location: 'New York', flag: 'america.png'),
    WorldTime(url: 'Asia/Bangkok', Location: 'Bangkok', flag: 'Bangkok.png'),
    WorldTime(
        url: 'Asia/Hong_Kong', Location: 'Hong Kong', flag: 'Hong_Kong.png'),
    WorldTime(url: 'Asia/Dubai', Location: 'Dubai', flag: 'Dubai.png'),
    WorldTime(url: 'Asia/Dili', Location: 'Dili', flag: 'Dili.png'),
    WorldTime(url: 'Asia/Riyadh', Location: 'Riyadh', flag: 'Riyadh.png'),
    WorldTime(url: 'America/Chicago', Location: 'Chicago', flag: 'america.png'),
    WorldTime(
        Location: 'Anchorage', flag: 'america.png', url: 'America/Anchorage')
  ];

  void getTimeData(index) async {
    WorldTime getTimeVar = locations[index];
    await getTimeVar.getTime();
    Navigator.pop(context, {
      'location': getTimeVar.Location,
      'flag': getTimeVar.flag,
      'time': getTimeVar.Time,
      'isDayTime': getTimeVar.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      getTimeData(index);
                    },
                    title: Text(locations[index].Location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('images/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
            }));
  }
}
