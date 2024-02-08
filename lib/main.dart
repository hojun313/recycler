import 'package:flutter/material.dart';
import 'dart:math';
import 'logo.dart';

void main() => runApp(MaterialApp(
  title: 'Navigation Basics',
  home: Logo(),
  )
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String trashType = '';
  String selectedTrashType = '';

  final List<String> imagePaths = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png',
    'assets/8.png',
  ];
  List<int> normalTrash = [0, 1];
  List<int> petTrash = [2, 3];
  List<int> plasticTrash = [4];
  List<int> vinylTrash = [5];
  List<int> glassTrash = [6];
  List<int> canTrash = [7];

  List<int> usedIndex = [];

  int currentImageIndex = 0;
  int imageNum = 8;
  int currentImageNum = 0;
  int point = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('같은 것끼리 모아서 버려요.'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                child: Text('화면이동'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Logo()),
                  );
                },
            ),
            SizedBox(
                width: double.infinity,
                child: Text(
                  '점수: $point',
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.left,
                )
            ),
            Container(
              color: Colors.greenAccent,
              height: 200,
              child: Center(child: Image.asset('${imagePaths[currentImageIndex]}')),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentImageNum < imageNum){

                    currentImageIndex = Random().nextInt(imagePaths.length);
                    while (usedIndex.contains(currentImageIndex)){
                      currentImageIndex = Random().nextInt(imagePaths.length);
                    }

                    usedIndex.add(currentImageIndex);
                    currentImageNum++;

                    print ('currentImageIndex: $currentImageIndex');

                    if (normalTrash.contains(currentImageIndex)){
                      selectedTrashType = '일반팩';
                    }
                    else if (plasticTrash.contains(currentImageIndex)){
                      selectedTrashType = '플라스틱';
                    }
                    else if (petTrash.contains(currentImageIndex)){
                      selectedTrashType = '페트';
                    }
                    else if (vinylTrash.contains(currentImageIndex)){
                      selectedTrashType = '비닐류';
                    }
                    else if (glassTrash.contains(currentImageIndex)){
                      selectedTrashType = '유리';
                    }
                    else if (canTrash.contains(currentImageIndex)){
                      selectedTrashType = '캔류';
                    }
                  }
                  else {
                    point = 99999999999;
                  }
                });
              },
              child: Text('Change Image'),
            ),
            Row(
              children: [
                Expanded(child: Container(
                  color: Colors.red,
                  height: 150,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent.shade100),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedTrashType == '일반팩'){
                          point += 1;
                        }
                        else {
                          point -= 1;
                        }
                      });
                    },
                    child: Image.asset('assets/trashcan.png'),
                  ),
                )),
                Expanded(child: Container(
                  color: Colors.green,
                  height: 150,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.greenAccent.shade100),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedTrashType == '페트'){
                          point += 1;
                        }
                        else {
                          point -= 1;
                        }
                      });
                    },
                    child: Text('페트'),
                  ),
                )),
                Expanded(child: Container(
                  color: Colors.blue,
                  height: 150,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent.shade100),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedTrashType == '플라스틱'){
                          point += 1;
                        }
                        else {
                          point -= 1;
                        }
                      });
                    },
                    child: Text('플라스틱'),
                  ),
                )),
                Expanded(child: Container(
                  color: Colors.yellow,
                  height: 150,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellowAccent.shade100),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedTrashType == '비닐류'){
                          point += 1;
                        }
                        else {
                          point -= 1;
                        }
                      });
                    },
                    child: Text('비닐류'),
                  ),
                )),
                Expanded(child: Container(
                  color: Colors.purple,
                  height: 150,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purpleAccent.shade100),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedTrashType == '유리'){
                          point += 1;
                        }
                        else {
                          point -= 1;
                        }
                      });
                    },
                    child: Text('유리'),
                  ),
                )),
                Expanded(child: Container(
                  color: Colors.orange,
                  height: 150,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.shade100),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedTrashType == '캔류'){
                          point += 1;
                        }
                        else {
                          point -= 1;
                        }
                      });
                    },
                    child: Text('캔류'),
                  ),
                )),
              ],
            )
          ],
        )
      )
    );

  }
}

