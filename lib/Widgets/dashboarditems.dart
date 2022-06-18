import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Constraints/contraints.dart';

class dashboarditems extends StatelessWidget {

  String keys;
  String value;


  dashboarditems({required this.keys,required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            width: 70.w,
            child: Text(value , style: KNumberValueDashBoard,textAlign: TextAlign.center,)),

        SizedBox(
          height: 10.h,
        ),
        Container(
            width: 75.w,
            child: Center(child: Text(keys , textAlign: TextAlign.center, maxLines: 1 , style: TextStyle(fontSize: 10.sp),) ))
      ],
    );
  }
}
