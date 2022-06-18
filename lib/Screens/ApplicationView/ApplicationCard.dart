import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ApplicationCard extends StatefulWidget {
  const ApplicationCard({Key? key}) : super(key: key);

  @override
  State<ApplicationCard> createState() => _ApplicationCardState();
}

class _ApplicationCardState extends State<ApplicationCard> {
  @override
  Widget build(BuildContext context) {


    return ListView(
      children: [
        card(),
        card(),
        card()

      ],
    );
  }
}

Widget card()
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 10.h,bottom: 5),
        child: Text("November 2020",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r) ,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0,1)
              )
            ]
        ),
        child:ExpansionTile(

          title: Text("Half day Application",style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
          trailing: Text("awaiting",style: TextStyle(color: Colors.grey),),

          subtitle:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Wed 16 Dec",style: TextStyle(color: Colors.black,fontSize: 18.sp),),
              Text("Casual",style: TextStyle(color: Color(0xFFFCAF17),fontSize: 12.sp),),
            ],
          ) ,

          children: [
            Stepper(
              controlsBuilder: (context, details) {
                return Container();
              },
              margin: EdgeInsets.all(0),
              steps: [
                Step(title: Text("SRM"),

                    subtitle: Text("Pending"), content: Container(height: 2.h,),
                    isActive: true,
                    state: StepState.complete),
                Step(title: Text("Center Academic Head"),
                  subtitle: Text("Pending"), content: Container(height: 2.h,),),
                Step(title: Text("Center Manager"),
                  subtitle: Text("Pending"), content: Container(height: 2.h,),),
              ],
            )


          ],

        ) ,
      ),
    ],
  );
}
// Row(
// children: [
// Expanded(child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Half day Application",style: TextStyle(color: Colors.grey),),
// SizedBox(height: 10.h,),
// Text("Wed 16 Dec",style: TextStyle(color: Colors.black,fontSize: 24.sp),),
//
// Text("Casual",style: TextStyle(color: Color(0xFFFCAF17),fontSize: 18.sp),),
//
// ],
// )),
//
// Expanded(child: Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// mainAxisAlignment: MainAxisAlignment.center,
//
// children: [
//
// ],
// )),
// ],
// )