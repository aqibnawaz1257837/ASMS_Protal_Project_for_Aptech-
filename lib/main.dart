import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Screens/Spleash_Screen.dart';


void main() async{

  // Add this line
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
  configLoading();
 //  print(myData(
 //    "[59,173,83,88,148,148,165,149,155,88,108,90"
 //        ",129,132,96,98,107,99,101,152,94,99,120,94,103,120,90,93,82,90,147,161,162,156,89,109,88,127,134,94,161,153,151,155,150,150,89,95,81,89,151,146,166,152,88,108,90,98,107,96,98,107,96,99,98,99,97,89,95,81,89,166,165,167,151,150,160,167,144,155,151,88,82,109,140,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,142,82,176]",
 //    "123"
 //  ));
 //
 //  print("ok ${"cnk".codeUnits}");
 // print( myEncrpyt("cnk"));
}

myEncrpyt(content) {
  var result = [];
  var resultasci = [];

  var str = '';

  // var codesArr = json.decode(content);


  for(var i = 0  ; i < content.codeUnits.length ; i++) {
    var calAscii = (content.codeUnits[i]-2);
    result.add(calAscii) ;
  }
  for(var i = 0 ; i < result.length ; i++) {
    var ch = String.fromCharCode(result[i]);
    str += ch ;
  }
  return str ;
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySpleashScreen(),
    );

  }
}


myData(content,String passcode) {
  var result = [];var str = '';

  var codesArr = json.decode(content);

  var passLen = passcode.length ;
  for(var i = 0  ; i < codesArr.length ; i++) {
    var passOffset = i%passLen ;
    var calAscii = (codesArr[i]-passcode.codeUnitAt(passOffset));
    result.add(calAscii) ;
  }
  for(var i = 0 ; i < result.length ; i++) {
    var ch = String.fromCharCode(result[i]); str += ch ;
  }
  return str ;
}






