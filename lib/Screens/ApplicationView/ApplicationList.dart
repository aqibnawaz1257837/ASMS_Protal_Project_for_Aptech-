import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Screens/ApplicationView/ApplicationCard.dart';
import 'package:untitled/Screens/ApplicationView/ApplicationForm.dart';

class ApplicationList extends StatefulWidget {
  const ApplicationList({Key? key}) : super(key: key);

  @override
  State<ApplicationList> createState() => _ApplicationListState();
}

class _ApplicationListState extends State<ApplicationList> with SingleTickerProviderStateMixin{



 late  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Text("ASMS Portal"),



          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 18.h,),
            Text("Applications",style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.w400),),

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
                isScrollable: true,
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
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'All',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Leave App',
                  ),



                  Tab(
                    text: 'BatchTransfer App',
                  ),

                  Tab(
                    text: 'Others App',
                  ),
                ],
              ),
            ),

            // tab bar view here
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),

                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    ApplicationCard(),

                    // second tab bar view widget
                    ApplicationCard(),

                    // second tab bar view widget
                    ApplicationCard(),

                    // second tab bar view widget
                    ApplicationCard(),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ApplicationForm(),));
      },
      backgroundColor: Color(0xFFFCAF17),
      child: Icon(Icons.add),
      ),
    );;
  }
}
