import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/Constraints/contraints.dart';


class GeneralForm extends StatelessWidget {



  TextEditingController editingControllerto = TextEditingController();
  TextEditingController editingControllerthe = TextEditingController();
  TextEditingController editingControllersubjects = TextEditingController();
  TextEditingController editingControllerbody = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFCAF17),
          title:Text("ASMS Portal" , style: KApppBarName,),
        ),


      body:SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[




              Container(
                height: 100.h,
                width: 100.w,

                child: Lottie.asset("assets/abc.json"),

              ),


              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Row(
                  children: <Widget>[


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.h),
                          child: Text("To" , style: TextStyle(fontSize: 16.sp , fontWeight: FontWeight.bold),),
                        ),

                        Container(
                          width: 160.w,
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),

                            child: TextFormField(
                              controller: editingControllerto,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "Sir Aqib",
                                labelText: "To",
                                labelStyle: TextStyle(fontSize: 20.sp) ,
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(fontSize: 16.sp , color: Colors.redAccent) ,
                              ),

                              validator: (value){

                                if(value == null || value.isEmpty){

                                  return "PLease Enter the Phone no";
                                }
                                else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),



                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.h),
                          child: Text("The" ,style: TextStyle(fontSize: 16.sp , fontWeight: FontWeight.bold),),
                        ),

                        Container(
                          width: 160.w,
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),

                            child: TextFormField(
                              controller: editingControllerto,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "Sir Shabeer",
                                labelText: "The",
                                labelStyle: TextStyle(fontSize: 20.sp) ,
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(fontSize: 16.sp , color: Colors.redAccent) ,
                              ),

                              validator: (value){

                                if(value == null || value.isEmpty){

                                  return "PLease Enter the Phone no";
                                }
                                else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),



                      ],
                    ),






                  ],
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.all(10.sp),

                  child: TextFormField(
                    controller: editingControllerthe,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Subject",
                      labelText: "Subject",
                      labelStyle: TextStyle(fontSize: 20.sp) ,
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 16.sp , color: Colors.redAccent) ,
                    ),

                    validator: (value){

                      if(value == null || value.isEmpty){

                        return "PLease Enter the Phone no";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),
              ),


              Container(
                child: Padding(
                  padding: EdgeInsets.all(10.sp),

                  child: TextFormField(
                    maxLength: 250,
                    maxLines: 12,
                    controller: editingControllerbody,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Body",
                      labelStyle: TextStyle(fontSize: 20.sp) ,
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 16.sp , color: Colors.redAccent) ,
                    ),

                    validator: (value){

                      if(value == null || value.isEmpty){

                        return "PLease Enter the Phone no";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),
              ),

              MaterialButton(onPressed: (){} , color: Colors.orange , child: Text("Submit"),)

            ],
          ),


        ),
      ),



    );
  }
}
