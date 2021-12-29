import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    print(data);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag'],
                    };
                  });
                },
                icon: Icon(
                    Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                    'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.grey[300],
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
