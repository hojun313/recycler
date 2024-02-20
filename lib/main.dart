import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recycler/ending.dart';
import 'dart:math';
import 'logo.dart';
import 'dart:async';

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

final List<String> imagePaths = [
  'assets/Quiz/1_1.png',
  'assets/Quiz/1_2.png',
  'assets/Quiz/1_3.png',
  'assets/Quiz/1_4.png',
  'assets/Quiz/1_5.png',
  'assets/Quiz/1_6_pla.jpg',
  'assets/Quiz/1_7_pla.jpg',
  'assets/Quiz/1_8_pla.jpg',
  'assets/Quiz/1_9_pla.jpg',
  'assets/Quiz/2_1.png',
  'assets/Quiz/2_2.png',
  'assets/Quiz/2_3_nor.jpg',
  'assets/Quiz/2_4_nor.jpg',
  'assets/Quiz/2_5_nor.jpg',
  'assets/Quiz/2_6_vin.jpg',
  'assets/Quiz/3_1.png',
  'assets/Quiz/3_2.png',
  'assets/Quiz/3_3_nor.jpg',
  'assets/Quiz/3_4_nor.jpg',
  'assets/Quiz/4_1.png',
  'assets/Quiz/4_2.png',
  'assets/Quiz/4_3.png',
  'assets/Quiz/4_4.png',
  'assets/Quiz/5_1.png',
  'assets/Quiz/5_2.png',
];
List<int> rounds = [5, 2, 2, 4, 2];
int roundPlus = 0;

String trashType = '';
String selectedTrashType = '';

List<int> normalTrash = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
List<int> petTrash = [0];
List<int> plasticTrash = [1];
List<int> vinylTrash = [];
List<int> glassTrash = [3];
List<int> canTrash = [2, 4];

List<int> usedIndex = [];

int currentImageIndex = 0;
int currentImageNum = 0;
int imageNum = imagePaths.length;
int level = 1;
int point = 0;

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    nextImage(context);
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('점수: $point, 레벨: $level, 남은 이미지: ${rounds[level-1]-currentImageNum}개',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                color: Colors.greenAccent,
                height: double.infinity,
                child: Center(child: Image.asset('${imagePaths[currentImageIndex]}', width: double.infinity, height: double.infinity, fit: BoxFit.contain,)),
              ),
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
                        nextImage(context);
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
                        nextImage(context);
                      });
                    },
                    child: Image.asset('assets/투명페트.png'),
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
                        nextImage(context);
                      });
                    },
                    child: Image.asset('assets/플라스틱.png'),
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
                        nextImage(context);
                      });
                    },
                    child: Image.asset('assets/비닐류.png'),
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
                        nextImage(context);
                      });
                    },
                    child: Image.asset('assets/유리.png'),
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
                        nextImage(context);
                      });
                    },
                    child: Image.asset('assets/캔류.png'),
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

void nextImage(BuildContext context) {
  if (currentImageNum < rounds[level-1]){

    currentImageIndex = Random().nextInt(rounds[level-1])+roundPlus;
    while (usedIndex.contains(currentImageIndex)){
      currentImageIndex = Random().nextInt(rounds[level-1])+roundPlus;
    }

    usedIndex.add(currentImageIndex);
    currentImageNum++;

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
    if (level == 5){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Ending()),
      );
    }
    roundPlus += rounds[level-1];
    level++;
    currentImageNum = 0;
    usedIndex = [];
    nextImage(context);
  }
}