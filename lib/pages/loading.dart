import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitSpinningCircle(
          color: Colors.blueGrey,
          size: 100.0,
        ),
      ),
    );
  }

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Algiers', flag: 'Algeria.png', url: '/africa/algiers');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag' : worldTime.flag,
      'time' : worldTime.time,
      'isDayTime' : worldTime.isDayTime,
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

}
