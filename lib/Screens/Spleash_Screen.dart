import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'MyHomePage.dart';
import '../main.dart';



class MySpleashScreen extends StatefulWidget {
  const MySpleashScreen({Key? key}) : super(key: key);

  @override
  _MySpleashScreenState createState() => _MySpleashScreenState();
}

class _MySpleashScreenState extends State<MySpleashScreen> with SingleTickerProviderStateMixin{


  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(milliseconds: 3000),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                MyHomePage()
            )
        )
    );





    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Color(0xFFFCAF17), end: Color(0xFF000000))
        .animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });




  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFCAF17),
      backgroundColor: animation!.value,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[



            Container(
              height: 250.0,
              width: 250.0,
              child: Lottie.asset("assets/abc.json"),


            ),




            Container(
              child: Hero(
                tag: "hero",
                child: Image(
                  image: AssetImage("images/Aptech Learning-03.png"),
                ),
              ),
              height: 350.0,
              width: 350.0,
              // decoration: BoxDecoration(
              //     color: Colors.amber[100],
              //     borderRadius: BorderRadius.circular(10.0),
              //     image: DecorationImage(
              //       image: AssetImage("images/Aptech Learning-03.png"),
              //     )
              // ),
            ),
            AnimatedTextKit(

              animatedTexts: [

                TyperAnimatedText("ASMS Portal Applicaiton" ,textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32.0),
                  speed: Duration(milliseconds: 100)
                ),

              ],

            )





          ],
        ),
      ),

    );
  }
}



