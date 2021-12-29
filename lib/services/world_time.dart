import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  late String time;
  String flag;
  String url = '';
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      Uri fullUrl = Uri.http('worldtimeapi.org', '/api/timezone/$url');
      Response response = await get(fullUrl);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:(int.parse(offset))));
      this.time = DateFormat.jm().format(now);
      this.isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    }catch(e){
      time = 'Can\'t get time';
    }

  }
}
