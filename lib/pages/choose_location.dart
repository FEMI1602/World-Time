import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';
class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<WorldTime> locations=[
    WorldTime(location: 'Abidjan',flag: 'Abidjan.png',url:'Africa/Abidjan'),
    WorldTime(location: 'Accra',flag: 'Accra.png',url:'Africa/Accra'),
    WorldTime(location: 'Algiers',flag: 'Algiers.png',url:'Africa/Algiers'),
    WorldTime(location: 'Bissau',flag: 'Bissau.png',url:'Africa/Bissau'),
    WorldTime(location: 'Cairo',flag: 'Cairo.png',url:'Africa/Cairo'),
    WorldTime(location: 'Ceuta',flag: 'Ceuta.png',url:'Africa/Ceuta'),
    WorldTime(location: 'El_Aaiun',flag: 'El_Aaiun.png',url:'Africa/El_Aaiun'),
    WorldTime(location: 'Johannesburg',flag: 'Johannesburg.png',url:'Africa/Johannesburg'),
    WorldTime(location: 'Juba',flag: 'Juba.png',url:'Africa/Juba'),
    WorldTime(location: 'Casablanca',flag: 'Casablanca.png',url:'Africa/Casablanca'),
    WorldTime(location: 'Casablanca',flag: 'Casablanca.png',url:'Africa/Casablanca'),

  ];

 void updatetime(index) async{
   WorldTime instance=locations[index];
   await instance.gettime();
   //navigate to home screen

   Navigator.pop(context, {
     'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isdaytime':instance.isdaytime,
   });


 }
  
  @override
  Widget build(BuildContext context) {
    print('build state function');
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        title: Text('Choose a Location '),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updatetime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
        ),
     
  
        
      
    );
  }
}