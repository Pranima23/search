import 'package:flutter/material.dart';
import 'package:search/pages/dialogs.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  AudioPlayer advancedPlayer = new AudioPlayer();
  AudioCache audioCache = new AudioCache();

  bool _music = false;
  bool _sound = false;
  bool s = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Settings',
              style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.grey[50],
              ),),
              backgroundColor: Colors.purple,
              centerTitle:true,
            ),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.yellow[600],
                    child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                    height: 150.0,
                    width: 250.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Music',
                          style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 1.5,
                            color: Colors.black54,
                          ),
                        ),

                        SizedBox(
                          width: 30.0,
                        ),

                        Switch(value: _music,
                         onChanged: (value){
                           setState(() {
                             _music = value;
                           });
                           if (value == true){
                             audioCache.play('music.mp3');
                           }
                           else{
                             advancedPlayer.stop();
                           }
                           
                         }),

                      
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            child: Text(
                              'Sound',
                              style: TextStyle(
                                fontSize: 20.0,
                                letterSpacing: 1.5,
                                color: Colors.black54,
                              ),
                            ),
                        ),
                        SizedBox(
                            width: 30.0,
                        ),
                        Switch(value: _sound,
                         onChanged: (value){
                           setState(() {
                             _sound = value;
                           });
                         }),
                       

                      ],
                    ),
                    
                  ],
                  
                ),),
              ),
              SizedBox(height: 15.0),
              FlatButton(

                onPressed: (()async{
                  print('exit');
                  await Dialogs.yesAbortDialog(context, 'Do you want to exit?', '', );
                   
                }),
                color: Colors.purple,
                padding: EdgeInsets.all(7.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  ),
                child: Text('Exit',
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 20.0,
                    letterSpacing: 1.5,
                    fontFamily: 'IndieFlower',
                ),
              ),
              ),  
            ],
          ),
        ),
      ),
    );
  }
}