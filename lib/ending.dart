import "package:flutter/material.dart";

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
              'Your score is $point!'
              'Thank you for playing!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}