import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Screens/Extras/GeneralApplicationList.dart';
import 'package:untitled/Screens/Extras/GeneralForms.dart';

import 'LeaveApplicationList.dart';


class FOrms extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(

          appBar: AppBar(
            backgroundColor: Color(0xFFFCAF17),
            title:Text("ASMS Portal" , style: KApppBarName,),

            bottom: TabBar(
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.sp),
                  child: Text("General Forms" , style: KTabTitleName),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.sp),
                  child: Text("Leaves Forms" ,style: KTabTitleName,),
                ),
              ],


            ),



          ),
          floatingActionButton:   FloatingActionButton(
            backgroundColor: Color(0xFFFCAF17),
            onPressed: (){

              Route route = MaterialPageRoute(builder: (c)=> GeneralForm());
              Navigator.push(context, route);


            } , child: Icon(
              Icons.add,
          ),),
          body:  TabBarView(
            children: [
              GeneralApplicationList(),






              LeaveApplicationList(),
            ],
          ),

        ),

      );


  }
}
