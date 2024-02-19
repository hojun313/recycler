import "package:flutter/material.dart";
import 'main.dart';
import 'dart:async';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..forward();  // 페이드 인 시작

    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    Timer(Duration(seconds: 2), () async {
      await _controller.reverse().then((_) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}