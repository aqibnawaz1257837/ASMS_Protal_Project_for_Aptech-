import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/ReuableTextFormField.dart';


class OthersForm extends StatefulWidget {

  @override
  State<OthersForm> createState() => _OthersFormState();
}

class _OthersFormState extends State<OthersForm> {

  // Initial Selected Value
  String dropdownvalue = 'Select to';

  // List of items in our dropdown menu
  var items = [
    'Select to',
    'SRO',
    'SRM',
    'DACH',
    'CAH',
  ];
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController subject = TextEditingController();
    TextEditingController body = TextEditingController();








    return SingleChildScrollView(

      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w , vertical: 15.h),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [



              Container(
                width: double.infinity,
                height: 40.h,
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
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {

                      dropdownvalue = newValue!;
                    });
                  },
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 0.5)
                ),
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


