import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashBoard.dart';
import 'LoginScreen.dart';
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(milliseconds: 3000),
            ()=>shareInit()
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

  shareInit() async{
    SharedPreferences logindata;

    logindata = await SharedPreferences.getInstance();
    bool newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => DashBaord()));
    }
    else
    {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => LoginScreen()));

    }


  }


  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, designSize:  Size(320,600),minTextAdapt: true);

    return Scaffold(
      // backgroundColor: Color(0xFFFCAF17),
      backgroundColor: animation!.value,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              height: 180.h,
              width: 180.w,
              child: Lottie.asset("assets/abc.json"),
            ),


            Container(
              child: Hero(
                tag: "hero",
                child: Image(
                  image: AssetImage("images/Aptech Learning-03.png"),
                ),
              ),
              height: 270.h,
              width: 270.w,
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

                TyperAnimatedText("ASMS Portal Application" ,textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28.sp),
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



