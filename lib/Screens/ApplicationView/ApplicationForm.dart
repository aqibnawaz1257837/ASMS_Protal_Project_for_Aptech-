import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Screens/ApplicationView/FormViews/LeaveForm.dart';



class ApplicationForm extends StatefulWidget {
  const ApplicationForm({Key? key}) : super(key: key);

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> with SingleTickerProviderStateMixin{

  String selectType="SELECT LEAVE TYPE";

  int? _key;

  _collapse() {
    int? newKey;
    do {
      _key = new Random().nextInt(10000);
    } while(newKey == _key);
  }

  late  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        backgroundColor: Color(0xFFFCAF17),
        title: Text("ASMS Portal" , style: KApppBarName,),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox(height: 18.h,),

            Text("New Application",style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w400),),

            Container(
              margin: EdgeInsets.only(top: 18),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  )
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color:  Color(0xFFFCAF17),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [


                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Leave Application',
                  ),

                  Tab(
                    text: 'BatchTransfer Application',
                  ),

                  Tab(
                    text: 'Others Application',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),


            Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [


                    LeaveForm(),
                    Container(
                      child: Text("s"),

                    ),
                    Container(
                      child: Text("s"),

                    ),

            ],)
            )




          ],
        ),
      ),

    );
  }



  Widget selectTypeMethod()
  {
    return Card(
      elevation: 1,
      child: ExpansionTile(
        key: new Key(_key.toString()),

        title: Text("Type" , style: TextStyle(color: Colors.black54 , fontSize: 12.sp),),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("$selectType" ,style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w400, fontSize: 14.sp),),
        ),
        leading: Container(
          child: Icon(
            Icons.grid_view, color: Colors.white,
          ),
          width: 35.w,
          height: 30.h,
          decoration: BoxDecoration(
              color: Color(0xFFFCAF17),
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 1,
                  offset: Offset(0,2),
                )
              ]
          ),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.all(10),
        children: [

          MaterialButton(
              minWidth: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              onPressed: () {

                setState(() {
                  selectType="Leave Application";
                });
                _collapse();
              },
              child: Align(alignment: Alignment.centerLeft,
                  child: Text("Leave Application",))),



          MaterialButton(
              minWidth: double.infinity,

              onPressed: () {
                setState(() {
                  selectType="BatchTransfer Application";
                  _collapse();

                });
              },
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text("Batch Transfer Application"))),

          MaterialButton(
              minWidth: double.infinity,

              onPressed: () {
                setState(() {
                  selectType="Others Application";
                });
                _collapse();

              },
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text("Others Application"))),

        ],
      ),
    );
  }

}
