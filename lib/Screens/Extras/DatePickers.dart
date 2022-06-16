import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DatePicker extends StatelessWidget {

  final dateController = TextEditingController();

  String label;
  String hint;


  DatePicker({required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
          width: 150.sp,
          child: TextField(
            readOnly: true,
            controller: dateController,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint, hintStyle: TextStyle(fontSize: 12.sp),
              labelStyle: TextStyle(fontSize: 14.sp) ,
              border: OutlineInputBorder(),
            ),
            onTap: () async {
              var date =  await showDatePicker(
                  context: context,
                  initialDate:DateTime.now(),
                  firstDate:DateTime(1900),
                  lastDate: DateTime(2100));
              dateController.text = date.toString().substring(0,10);
            },)
      ),
    );
  }
}

