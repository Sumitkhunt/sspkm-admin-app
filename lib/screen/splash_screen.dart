import 'dart:async';

import 'package:admin/rout/routing_page.dart';
import 'package:admin/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    _controller.addListener(() {
      if (_controller.isCompleted) {
        Routingpage.pushreplase(context: context, navigateto: login());
      }
    });
  }
  @override

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: ScaleTransition(
          scale: _animation,
          child:Center(
            child: Image.asset("assets/images/logo.png",height:height*0.70 ,width: width*0.70,),
          ),
        ));
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}


