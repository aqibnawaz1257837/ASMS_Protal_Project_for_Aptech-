import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaveForm extends StatelessWidget {
  const LeaveForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();


    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(320, 600),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Container(

      child:Form(
        key: _formKey,
        child: Column(
          children: [

            //to date
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r)
                ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                  ),
                hintText: "12-May-2020",
                prefixIcon: Icon(Icons.date_range,color: Color(0xFFFCAF17),)
              ),

            ),


            //from date


            //subject

            //body

            //submit





          ],
        ),
      )
    );
  }
}
