import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Models/user_data.dart';
import 'package:untitled/QR%20CODE/QRCOde.dart';
import 'package:untitled/Screens/Forms.dart';
import 'package:untitled/Screens/NewsAndEvents.dart';
import 'package:untitled/Screens/Service.dart';
import 'package:untitled/Screens/ShowAttendence.dart';
import 'package:untitled/Widgets/ReusableContainer.dart';

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
        setState(() {
          isLoading=false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Text("ASMS Portal" , style: KApppBarName,),

            IconButton(onPressed: (){
              Navigator.pop(context);
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


              Navigator.pop(context);
            },
                icon: Icon(
              Icons.power_settings_new
            ))
          ],
        ),
        centerTitle: true,




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
                Route route = MaterialPageRoute(builder: (c)=> MyProfile());
                Navigator.push(context, route);
                },
            ),

            ListTile(
              leading: Icon(Icons.event_available), title: Text("News And Events"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.feedback), title: Text("Applications Forms"),
              onTap: () {
                Route route = MaterialPageRoute(builder: (c)=> FOrms());
                Navigator.push(context, route);
                },
            ),

            ListTile(
              leading: Icon(Icons.feedback), title: Text("Feedback"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.error_outline), title: Text("Complains"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.settings), title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts), title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            SizedBox(
              height: 10.0,
              width: 30.0,
              child: Divider(

                color: Colors.orange,
              ),
            ),


            ListTile(
              leading: Icon(Icons.logout), title: Text("SignOut"),
              onTap: () {
                Navigator.pop(context);
              },
            ),




          ],
        ),
      ),
    body: Column(
      children: <Widget>[



        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("${userData!.name}" , style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold),),
              ),
              GestureDetector(
                onTap: (){
                  Route route = MaterialPageRoute(builder: (c)=> MyProfile());
                  Navigator.push(context, route);
                },
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage("${userData!.image}"),
                ),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${userData!.totalAttendence}" , style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 10.0,
                ),
                Text("Attend Classes")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${userData!.totalAbsent}" , style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 10.0,
                ),
                Text("Absents")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("${userData!.totalLeave}" , style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 10.0,
                ),
                Text("Leaves")

              ],
            ),


          ],
        ),




        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: (){

                    print("Open Page");



                    Route route = MaterialPageRoute(builder: (c)=> QRViewExample());
                    Navigator.push(context, route);

                  },
                  child: ReUseableContainer(
                    iconData: Icons.add_task,
                    text: "Attendence",

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: (){
                    Route route = MaterialPageRoute(builder: (c)=> ShowAttendence());
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
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(

                onTap: (){

                  Route route = MaterialPageRoute(builder: (c)=> NewsAndEvents());
                  Navigator.push(context, route);
                },
                child: ReUseableContainer(
                  iconData: Icons.event_available,
                  text: "News And Events",

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){

                  Route route = MaterialPageRoute(builder: (c)=> FOrms());
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
}

