import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {

  AudioCache audioCache;
  AudioPlayer advancedPlayer;

  @override

  void initState(){
    super.initState();
    initPlayer();
  }

  void initPlayer(){
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  }

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          RaisedButton(
            child: Text('Play!'),
            onPressed: (){
              audioCache.play('music.mp3');
            }
          ),
          RaisedButton(
            child: Text('Pause'),
            onPressed: (){
              advancedPlayer.pause();
            }
          ),
        ],
      ),
    );
  }
}