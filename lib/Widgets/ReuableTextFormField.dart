import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ReuableTextFormField extends StatelessWidget {

  String hint;
  IconData icon;
  TextEditingController controller;

  Function()? ontap;



  ReuableTextFormField({required this.hint,required this.icon , required this.controller  , this.ontap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      controller: controller,
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
          hintText: hint,
          prefixIcon: Icon(icon,color: Color(0xFFFCAF17),)
      ),

    );
  }
}