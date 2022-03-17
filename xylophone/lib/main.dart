import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Xylophone Application",style: TextStyle(

            color: Colors.black,
          ),
          ),
        ),

        body: xyloPhone(),

      ),
    );
  }
}

class xyloPhone extends StatefulWidget {
  const xyloPhone({Key? key}) : super(key: key);



  @override
  _xyloPhoneState createState() => _xyloPhoneState();
}

class _xyloPhoneState extends State<xyloPhone> {
  void playAudio(int i){
    final player = AudioCache();
    player.play("assets_note$i.wav");
  }

  Expanded tile(Color color, int num){
    return Expanded(
      child: TextButton(
        onPressed: () {
          playAudio(num);
        },
        child: Text(
            ""
        ),
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            tile(Colors.red,1),
            tile(Colors.orange,2),
            tile(Colors.yellow,3),
            tile(Colors.green,4),
            tile(Colors.blue,5),
            tile(Colors.indigo,6),
            tile(Colors.purple,7),


          ],

    )
    );
  }
}

