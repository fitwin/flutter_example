import 'package:flutter/material.dart';
import 'package:gplayer/gplayer.dart';


class GPlayerViewer extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<GPlayerViewer> {
  GPlayer player;
  @override
  void initState() {
    super.initState();
    //1.create & init player
    player = GPlayer(uri: 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4')
      ..init()
      ..addListener((_) {
        //update control button out of player
        setState(() {});
      });
  }

  @override
  void dispose() {
    player?.dispose(); //2.release player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GPlayer'),
        ),
        body: player.display,//3.put the player display in Widget tree
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              player.isPlaying ? player.pause() : player.start();
            });
          },
          child: Icon(
            player.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}