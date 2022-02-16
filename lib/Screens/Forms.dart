import 'package:flutter/material.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Screens/GeneralForms.dart';

import 'GeneralApplicationList.dart';
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

            bottom: const TabBar(
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text("General Forms" , style: KTabTitleName),
                ),
                Text("Leaves Forms" ,style: KTabTitleName,),
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
          body: const TabBarView(
            children: [
              GeneralApplicationList(),






              LeaveApplicationList(),
            ],
          ),

        ),

      );


  }
}
