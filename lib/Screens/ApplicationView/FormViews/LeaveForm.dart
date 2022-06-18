import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../Widgets/ReuableTextFormField.dart';



class LeaveForm extends StatefulWidget {

  @override
  State<LeaveForm> createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController to = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();



  @override
  Widget build(BuildContext context) {



    return SingleChildScrollView(

      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w , vertical: 15.h),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              //to date

              ReuableTextFormField(
                icon: Icons.date_range,
                hint: 'Start Date',
                controller: to,
                ontap: () async{

                  DateTime? picktime = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100)
                  );


                  if(picktime != null){
                    setState(() {
                      to.text = DateFormat('dd-MM-yyyy').format(picktime);
                    });
                  }
                },
              ),


              SizedBox(
                height: 10,
              ),

              // from date
              ReuableTextFormField(
                icon: Icons.date_range,
                hint: 'End Date',
                controller: from,
                ontap: () async{

                  DateTime? picktime = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100)
                  );


                  if(picktime != null){
                    setState(() {
                      from.text = DateFormat('dd-MM-yyyy').format(picktime);
                    });
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              //subject

              ReuableTextFormField(
                icon: Icons.date_range,
                hint: 'Subjects',
                controller: subject,
              ),
              SizedBox(
                height: 10,
              ),

              //body

              Container(
                child: TextFormField(
                  maxLength: 250,
                  maxLines: 12,
                  controller: body,
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),

                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 0.5,
                          color: Color(0xFFFCAF17),
                        )
                    ),
                    hintStyle: TextStyle(
                        fontSize: 10.sp
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.grey
                        )
                    ),
                    hintText: "body",
                  ),

                  validator: (value){

                    if(value == null || value.isEmpty){

                      return "PLease Enter the Body text";
                    }
                    else {
                      return null;
                    }
                  },
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //submit


              MaterialButton(
                onPressed: (){} ,
                height: 30.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),

                color: Color(0xFFFCAF17),
                child: Text("Submit" , style: TextStyle(color: Colors.white , fontSize: 14.sp  , fontWeight: FontWeight.w600 , letterSpacing: 1.5),),
              ),




            ],
          )
      ),
    );
  }
}



