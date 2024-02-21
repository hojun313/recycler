import "package:flutter/material.dart";
import 'package:recycler/main.dart';

class Ending extends StatelessWidget {
  final int point;
  Ending(this.point, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ending'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '최종 점수는 $point점 입니다! \n'
              'Thank you for playing!',
              style: TextStyle(fontSize: 24), textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp(true)));
              },
              child: Text('재시도!'),
            ),
          ],
        ),
      ),
    );
  }
}