import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;  //location name for the UI
  String time;  //time in location
  String flag;
  String url;  //location url

  bool isdaytime;

  WorldTime({this.location,this.flag,this.url});

  Future <void> gettime() async{

    try{
      //make the request
    Response response =await get('http://worldtimeapi.org/api/timezone/$url');
    Map data =jsonDecode(response.body);
   // print(data);

   //get properties from data
   String datetime=data['datetime'];
   String offset=data['utc_offset'].substring(1,3);
   print(datetime);
   print(offset);
  
  //create a date time object
  
  DateTime now =DateTime.parse(datetime);
  now=now.add(Duration(hours: int.parse(offset) ));

  isdaytime= now.hour > 6 && now.hour< 20? true:false;
  time=DateFormat.jm().format(now);

    }
    catch(e){
      print('Caught error $e');
      time='could not get time data';
    }


    
  }

}


