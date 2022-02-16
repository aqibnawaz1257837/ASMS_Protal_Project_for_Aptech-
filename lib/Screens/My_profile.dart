import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Widgets/ResuableProfileTiles.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Color(0xFFFCAF17),
        title: Text("ASMS Portal" , style: KApppBarName,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[


        ClipPath(
        child: Container(
          height: 150,
          color: Color(0xFFFCAF17),
        ),
          clipper: CustomClipPath(),
        ),

            CircleAvatar(
              backgroundImage: AssetImage("images/aqib.jpg"),
              radius: 82.0,
            ),
            SizedBox(
              height: 15.0,
            ),

            Column(
              children: <Widget>[
                Text("Aqib Nawaz" ,style: KProfileNameText
                ),
                SizedBox(
                  height: 10.0,
                ),

                Text("Studnet1122565" , style: KProfileStidText),
                SizedBox(
                  height: 10.0,
                ),
                Text("Aqibnawaz015@gmail.com" , style: KProfileEmailText),
                SizedBox(
                  height: 10.0,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: ExpansionTile(
                      title: Text("Student Information"),
                      subtitle: Text("Show details"),
                      children: <Widget>[

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[


                            ResuableProfileTiles(
                              keys: "Enrollment",
                              value: "Student1122666",

                            ),

                            //
                            // ResuableProfileTiles(
                            //
                            // ),

                            ResuableProfileTiles(
                              keys: "Father Name:",
                              value: "Nawaz Ahmed",

                            ),
                            ResuableProfileTiles(
                              keys: "Faculty Name:",
                              value: "Sir Shabeer",

                            ),
                            ResuableProfileTiles(
                              keys: "Batch Code:",
                              value: "PR-202002F",
                            ),
                            ResuableProfileTiles(
                              keys: "Batch Start Date:",
                              value: "20/02/2020",
                            ),
                            ResuableProfileTiles(
                              keys: "Time Slot",
                              value: "5pm to 7pm",
                            ),
                            ResuableProfileTiles(
                              keys: "Days",
                              value: "MWF",
                            ),
                            ResuableProfileTiles(
                              keys: "Course",
                              value: "Course",
                            ),
                            ResuableProfileTiles(
                              keys: "NIC Number",
                              value: "42101-8504486-6",
                            ),
                            ResuableProfileTiles(
                              keys: "PTCL Number",
                              value: "Mein nahi btwoan gya",
                            ),
                            ResuableProfileTiles(
                              keys: "Cell Number",
                              value: "Mein nahi btwoan gya",
                            ),
                            ResuableProfileTiles(
                              keys: "Address",
                              value: "Mein Q nahi btwoan gya",
                            ),

                          ],
                        ),


                      ],
                    ),
                  ),
                )



              ],
            )




          ],
        ),
      ),


    );
  }
}




class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
        - 40, size.width/2, size.height-20);
    path.quadraticBezierTo(3/4*size.width, size.height,
        size.width, size.height-30);
    path.lineTo(size.width, 0);

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}