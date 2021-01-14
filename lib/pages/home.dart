import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;
    print(data);

    //set background image
    String bgimage=data['isdaytime']? 'day.jpg':'night.jpeg';
    Color bgcolor=data['isdaytime']? Colors.blue: Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            )
          ),
                  child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                   dynamic result=await Navigator.pushNamed(context,'/location');
                   setState(() {
                     data={
                       'time':result['time'],
                       'location':result['location'],
                       'isdaytime':result['isdaytime'],
                       'flag':result['flag'],

                     };
                   });
                  }, 
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey,
                    ), 
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 20,
                    ),
                    )
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 2,
                        ),
                      )

                  ],),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 60,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}