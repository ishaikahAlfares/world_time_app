import 'package:flutter/material.dart';
import 'package:world_time/services/WorldTimeClass.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void SetUpWorldTime() async {
    WorldTime time =
        WorldTime(Location: 'Riyadh', flag: 'saudi.png', url: 'Asia/Riyadh');
    await time.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': time.Location,
      'flag': time.flag,
      'time': time.Time,
      'isDayTime': time.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    SetUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );
  }
}
