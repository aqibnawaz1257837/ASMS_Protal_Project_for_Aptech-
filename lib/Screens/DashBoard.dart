import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Models/user_data.dart';
import 'package:untitled/Screens/ApplicationView/ApplicationList.dart';
import 'package:untitled/Screens/AttendenceViews/QRCOde.dart';
import 'package:untitled/Screens/LoginScreen.dart';
import 'package:untitled/Service/Service.dart';
import 'package:untitled/Widgets/ReusableContainer.dart';
import 'package:untitled/Widgets/dashboarditems.dart';

import 'AttendenceViews/AttendenceReport.dart';
import 'My_profile.dart';



class DashBaord extends StatefulWidget {
  // UserData? userData;
  //
  // DashBaord(this.userData);


  @override
  _DashBaordState createState() => _DashBaordState();
}

class _DashBaordState extends State<DashBaord> {
  Obj? userData;


  var ss={
    "book":"android",
    "student_ids":["Student1242021","Student1232823",
      "Student1222094","Student1182639"],
    "batchCode":"PR-201907G+"
  };
   SharedPreferences? logindata;

  bool isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    // userData=widget.userData!.obj;
    super.initState();

    print("sdksdjflk");
    fetchData();


  }

  fetchData() async{

    isLoading=true;
      logindata = await SharedPreferences.getInstance();
      var id = (logindata!.getString('id') ?? "0");

    Service.fetch_std_data(id).then((value)
    {

      if(value!=0)
      {
        UserData data=value;

        userData=data.obj;
        print("jfkjs ${id}");


        setState(() {
          isLoading=false;
        });
      }
    });
  }


@override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("i am deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print(" i am disposse");
  }
  @override
  Widget build(BuildContext context) {



    return isLoading?Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Text("ASMS Portal"),

            IconButton(onPressed: (){
              logindata!.setBool('login', true);

              Navigator.pushReplacement(
                  context, new MaterialPageRoute(builder: (context) => LoginScreen()));
            },
                icon: Icon(
                    Icons.power_settings_new
                ))



          ],
        ),
        centerTitle: true,
      ),

      body: Center(child: CircularProgressIndicator(),),):Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Text("ASMS Portal" , style: KApppBarName,),

            IconButton(onPressed: (){
              logindata!.setBool('login', true);

              Navigator.pushReplacement(
                  context, new MaterialPageRoute(builder: (context) => LoginScreen()));
            },
                icon: Icon(
              Icons.power_settings_new
            ))
          ],
        ),
        centerTitle: true,
        toolbarHeight: 44.h,




      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("${userData!.name}"),
              accountEmail: Text("${userData!.stdid}"),
              decoration: BoxDecoration(
                color: Color(0xFFFCAF17)
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage:NetworkImage("${userData!.image}"),

              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person), title: Text("Profile"),
              onTap: () {
                Route route = MaterialPageRoute(builder: (c)=> MyProfile(userData));
                Navigator.push(context, route);
                },
            ),

            ListTile(
              leading: Icon(Icons.event_available), title: Text("News And Events"),
              onTap: () {
                // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Coming Soon")));

              },
            ),

            ListTile(
              leading: Icon(Icons.feedback), title: Text("Applications Forms"),
              onTap: () {
                // Route route = MaterialPageRoute(builder: (c)=> FOrms());
                // Navigator.push(context, route);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Coming Soon")));

                },
            ),

            ListTile(
              leading: Icon(Icons.feedback), title: Text("Feedback"),
              onTap: () {
                // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Coming Soon")));

              },
            ),

            ListTile(
              leading: Icon(Icons.error_outline), title: Text("Complains"),
              onTap: () {
                // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Coming Soon")));

              },
            ),

            ListTile(
              leading: Icon(Icons.settings), title: Text("Settings"),
              onTap: () {
                // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Coming Soon")));

              },
            ),
            ListTile(
              leading: Icon(Icons.contacts), title: Text("Contact Us"),
              onTap: () {
                // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Coming Soon")));

              },
            ),

            SizedBox(
              height: 10.h,
              width: 30.w,
              child: Divider(

                color: Colors.orange,
              ),
            ),


            ListTile(
              leading: Icon(Icons.logout), title: Text("SignOut"),
              onTap: () {
                logindata!.setBool('login', true);
                Navigator.pushReplacement(
                    context, new MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),




          ],
        ),
      ),
    body: Column(
      children: <Widget>[



        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(child: Text("${userData!.name}" , style: TextStyle(fontSize: 20.sp , fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis)),
              ),
              GestureDetector(
                onTap: (){
                  Route route = MaterialPageRoute(builder: (c)=> MyProfile(userData));
                  Navigator.push(context, route);
                },
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundImage: NetworkImage("${userData!.image}"),
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10.r)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              dashboarditems(
                value: "12",
                keys: "Total Classes",
              ),
              dashboarditems(
                value: "${userData!.totalAttendence}",
                keys: "Attend Classes",
              ),

              dashboarditems(
                value: "${userData!.totalAbsent}",
                keys: "Absents",
              ),

              dashboarditems(
                value: "${userData!.totalLeave}",
                keys: "Leaves",
              ),
            ],
          ),
        ),




        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.all(10.w),
                child: GestureDetector(
                  onTap: (){
                    EasyLoading.show(status: 'loading...');


                    Service.checkDateTime(userData!.stdid).then((value) {
                      EasyLoading.dismiss();


                      if(value=="0")
                      {
                        showDialod("Some Thing Wrong Conatact IT");
                      }
                      else if(value=="marked")
                      {
                        showDialod("Already Done Attendence");
                      }
                      else if(value=="timeout")
                      {
                        showDialod("Your Class Timing is ${userData!.timing}");
                      }
                      else if(value=="weekday_not_match")
                      {
                        showDialod("Your Class day is ${userData!.day}");
                      }
                      else if(value=="ok")
                      {

                      Route route = MaterialPageRoute(builder: (c)=> QRViewExample(userData));
                      Navigator.push(context, route)
                          .whenComplete(() {

                        print("i am call back");
                        fetchData();
                      });
                      }
                      else
                      {
                        showDialod("Some Thing Wrong Conatact IT");

                      }



                    });

                    // Route route = MaterialPageRoute(builder: (c)=> QRViewExample());
                    // Navigator.push(context, route)
                    //     .whenComplete(() {
                    //
                    //   print("i am call back");
                    //   fetchData();
                    // });

                    // var slot = userData!.slot.split("-");
                    //
                    // print("slot ${slot}");
                    // var starttime = slot[0].trim();
                    // var endtime = slot[1].trim();
                    //
                    // DateTime tempstarttime = new DateFormat.Hm().parse(starttime);
                    // DateTime tempendtime = new DateFormat.Hm().parse(endtime);
                    //
                    // TimeOfDay nowTime=TimeOfDay.now();
                    //
                    // final localizations = MaterialLocalizations.of(context);
                    // final formattedTimeOfDay = localizations.formatTimeOfDay(nowTime);
                    // DateTime curtempendtime = new DateFormat.Hm().parse(formattedTimeOfDay);
                    //
                    //
                    //
                    // final classStartTime = new TimeOfDay.fromDateTime(tempstarttime);
                    // final classEndTime = new TimeOfDay.fromDateTime(tempendtime);
                    // final classCurrTime = new TimeOfDay.fromDateTime(curtempendtime);
                    //
                    //
                    // print("class Start time ${classStartTime.hour}");
                    // print("class end time ${classEndTime.hour}");
                    // print("class curr time ${classCurrTime.hour}");
                    //
                    //
                    // print("logic ${classCurrTime.hour<=classEndTime.hour}");
                    //
                    // if(classCurrTime.hour>=classStartTime.hour && classCurrTime.hour<=classEndTime.hour)
                    // {
                    //   Route route = MaterialPageRoute(builder: (c)=> QRViewExample());
                    //   Navigator.push(context, route)
                    //       .whenComplete(() {
                    //
                    //     print("i am call back");
                    //     fetchData();
                    //   });
                    // }
                    // else
                    // {
                    //   showDialod("Your Class Timing is ${userData!.slot}");
                    // }

                  //  print("curr time ${classCurrTime.hour}");




                 //    print("starttime${starttime},endtime${endtime.trim()}");
                 //
                 //    var now=DateTime.now();
                 //
                 //    var nowtime="${now.hour}:${now.minute}";
                 //    DateTime tempstarttime = new DateFormat.Hm().parse(nowtime);
                 // //   DateTime tempendtime = new DateFormat("hh:mm").parse(endtime);
                 //
                 //    print("starttime ${tempstarttime} ,");


                  },
                  child: ReUseableContainer(
                    iconData: Icons.add_task,
                    text: "Attendence",

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: GestureDetector(
                  onTap: (){
                    Route route = MaterialPageRoute(builder: (c)=> AttendenceReport(
                      userData!.stdid
                    ));
                    Navigator.push(context, route);

                  },

                  child: ReUseableContainer(

                    iconData: Icons.slideshow,
                    text: "Show Attendence",


                  ),
                ),
              ),



            ],
          ),
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(10.w),
              child: GestureDetector(

                onTap: (){

                  // Route route = MaterialPageRoute(builder: (c)=> NewsAndEvents());
                  // Navigator.push(context, route);

                },
                child: ReUseableContainer(
                  iconData: Icons.event_available,
                  text: "News And Events",

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: GestureDetector(
                onTap: (){

                  Route route = MaterialPageRoute(builder: (c)=> ApplicationList());
                  Navigator.push(context, route);

                },
                child: ReUseableContainer(
                  iconData: Icons.dynamic_form,
                  text: "Applications Forms",


                ),
              ),
            ),



          ],
        ),




      ],


    ),
    );
  }

  showDialod(s){

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Msssage Alert"),
          content: Text("${s}"),
          actions: [

            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],
        );
      },

    );

  }
  void toast(String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${s}")));
  }
}


