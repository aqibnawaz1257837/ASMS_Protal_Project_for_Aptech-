import 'package:flutter/material.dart';



class ReUseableContainer extends StatelessWidget {


  final IconData iconData;
  final String text;


  ReUseableContainer({required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 250.0,
      width: 160.0,
      decoration: BoxDecoration(
        color: Color(0xFFFCAF17),
        borderRadius: BorderRadius.circular(20.0),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[



          Icon(
            iconData,
            size: 72.0,
            color: Colors.white,
          ),

          SizedBox(
            height: 12.0,
          ),


          Text(text , style: TextStyle(

              color: Colors.white ,
              fontWeight: FontWeight.w600,
              fontSize: 18.0
          ),)

        ],
      ),
    );
  }
}
