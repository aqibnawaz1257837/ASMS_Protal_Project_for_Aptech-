import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/ReuableTextFormField.dart';




class BatchTransferForm extends StatefulWidget {
  const BatchTransferForm({Key? key}) : super(key: key);

  @override
  State<BatchTransferForm> createState() => _BatchTransferFormState();
}

class _BatchTransferFormState extends State<BatchTransferForm> {

  // Initial Selected Value
  String dropdownvalue = 'Select the day';

  // List of items in our dropdown menu
  var items = [
    'Select the day',
    'MWF',
    'TTS',
  ];


  final _formKey = GlobalKey<FormState>();

  TextEditingController batchcode = TextEditingController();
  TextEditingController currentbook = TextEditingController();
  TextEditingController batchtiming = TextEditingController();


  TextEditingController body = TextEditingController();



  @override
  Widget build(BuildContext context) {




    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(10.h),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Text("Batch Tranfer Form Fees" , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),),
                  Text("PKR 3,000" , style: TextStyle(
                      color: Colors.red
                  ),),

                ],
              ),

              SizedBox(
                height: 10.h,
              ),


              Text("Current Batch Info" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 14.sp),),

              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(

                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5 , 1),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 2
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[



                    ReuableTextFormField(
                        hint: "Batch Code",
                        icon: Icons.grid_view,
                        controller: batchcode),
                    SizedBox(
                      height: 10,
                    ),

                    ReuableTextFormField(
                        hint: "Current Book",
                        icon: Icons.grid_view,
                        controller: currentbook),
                    SizedBox(
                      height: 10,
                    ),


                    ReuableTextFormField(
                        hint: "Batch Timing",
                        icon: Icons.grid_view,
                        controller: batchtiming),

                  ],
                ),
              ),


              SizedBox(
                height: 10,
              ),


              Text("New Batch Info" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600 , fontSize: 14.sp),),

              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(

                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5 , 1),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 2
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[



                    Container(
                      width: double.infinity,
                      height: 40.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 0.5),
                          borderRadius: BorderRadius.circular(10.r),

                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      margin: EdgeInsets.symmetric(vertical: 10.w),
                      child: DropdownButton(

                        // Initial Value
                        value: dropdownvalue,
                        elevation: 0,
                        isExpanded: true,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items , style: TextStyle(
                              fontSize: 10.sp
                            ),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),

                    ReuableTextFormField(
                        hint: "Batch Transfer timing",
                        icon: Icons.grid_view,
                        controller: currentbook),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Text("Reason" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600 , fontSize: 14.sp),),
              SizedBox(
                height: 10,
              ),


              Container(
                child: TextFormField(
                  maxLength: 150,
                  maxLines: 1,
                  controller: body,
                  autofocus: false,
                  onTap: () async{

                    DateTime? picktime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100)
                    );


                    if(picktime != null){
                      setState(() {


                      });
                    }



                  },

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
                height: 5.h,
              ),

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

