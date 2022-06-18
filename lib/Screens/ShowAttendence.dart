import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Constraints/contraints.dart';



class ShowAttendence extends StatefulWidget {

  @override
  _ShowAttendenceState createState() => _ShowAttendenceState();
}

class _ShowAttendenceState extends State<ShowAttendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Text("ASMS Portal" , style: KApppBarName,),
        centerTitle: true,
      ),


      body: Column(
        children: <Widget>[
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 16.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //
          //
          //       DatePicker(
          //         label: "Enter Start Date",
          //         hint: "Start Date",
          //       ),
          //       SizedBox(width: 20.w),
          //
          //       DatePicker(
          //         label: "Enter End Date",
          //         hint: "End Date",
          //       ),
          //     ],
          //   ),
          // ),


          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)
                        ),
                        child: Card(
                          elevation: 2.0,
                          shadowColor: Colors.amber,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Text("Date" , style: KProfileEmailText,),

                                Icon(Icons.check , color: Colors.green,)

                              ],
                            ),
                          ),

                        ),
                      ),
                    );

                  }

              ),
            ),
          ),



          Padding(
            padding: EdgeInsets.only(left: 10.h , right: 10.h),
            child: Container(
              height: 55.h,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: Row(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      children: <Widget>[



                        Row(

                          children: <Widget>[
                            Text("Total Classes" ,style: KProfileEmailText,),
                            SizedBox(width:160.sp,),
                            Text("12" ,style: KNumberValue,),

                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Attend Classes" , style: KProfileEmailText,),
                            SizedBox(width: 145.sp,),

                            Text("10" , style: KNumberValue,),

                          ],
                        ),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          )


        ],
      )
    );
  }
}


