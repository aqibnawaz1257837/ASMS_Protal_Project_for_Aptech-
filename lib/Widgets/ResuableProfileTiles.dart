import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Constraints/contraints.dart';

class ResuableProfileTiles extends StatelessWidget {

  final String keys;
  final String value;


  ResuableProfileTiles({required this.keys, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Card(
          elevation: 2.0,
          shadowColor: Color(0xFFFCAF17),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(keys , style: KProfileTileKEyName,overflow: TextOverflow.ellipsis, ),
                SizedBox(width: 3.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Container(width: 120.w,
                      child: Text(value ,style: KProfileTileValueName ,
                        maxLines: 3 ,
                        overflow: TextOverflow.ellipsis,)),
                ),

              ],
            ),
          )),
    );
  }
}
