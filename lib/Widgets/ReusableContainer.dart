import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ReUseableContainer extends StatelessWidget {


  final IconData iconData;
  final String text;


  ReUseableContainer({required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 160.h,
      width: 140.w,
      decoration: BoxDecoration(
        color: Color(0xFFFCAF17),
        borderRadius: BorderRadius.circular(20.r),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[



          Icon(
            iconData,
            size: 72.sp,
            color: Colors.white,
          ),

          SizedBox(
            height: 12.h,
          ),


          Text(text ,
            textAlign: TextAlign.center,
            style: TextStyle(

              color: Colors.white ,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp
          ),)

        ],
      ),
    );
  }
}
