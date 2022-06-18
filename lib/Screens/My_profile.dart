import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Models/user_data.dart';
import 'package:untitled/Widgets/ResuableProfileTiles.dart';


class MyProfile extends StatefulWidget {

  Obj? userData;
   MyProfile(this.userData);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {




  @override
  Widget build(BuildContext context) {
    print("aqqqib ${widget.userData?.image}");



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
          height: 100.h,
          color: Color(0xFFFCAF17),
        ),
          clipper: CustomClipPath(),
        ),

            CircleAvatar(
              backgroundImage: NetworkImage("${widget.userData?.image}"),
              radius: 62.r,
            ),
            SizedBox(
              height: 15.0.h,
            ),

            Column(
              children: <Widget>[
                Text("${widget.userData!.name}" ,style: KProfileNameText
                ),
                SizedBox(
                  height: 10.0.h,
                ),

                Text("${widget.userData!.stdid}" , style: KProfileStidText),
                SizedBox(
                  height: 10.0.h,
                ),
                Text("${widget.userData!.email}" , style: KProfileEmailText),
                SizedBox(
                  height: 10.0.h,
                ),

                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10.r)
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
                              value: "${widget.userData!.stdid}",

                            ),

                            ResuableProfileTiles(
                              keys: "Father Name:",
                              value: "${widget.userData!.fname}",

                            ),
                            ResuableProfileTiles(
                              keys: "Faculty Name:",
                              value: "${widget.userData!.faculty}",

                            ),
                            ResuableProfileTiles(
                              keys: "Batch Code:",
                              value: "${widget.userData!.batch}",
                            ),
                            ResuableProfileTiles(
                              keys: "Current Semester:",
                              value: "${widget.userData!.semester}",
                            ),
                            ResuableProfileTiles(
                              keys: "Batch Start Date:",
                              value: "${widget.userData!.semester}",
                            ),
                            ResuableProfileTiles(
                              keys: "Time Slot:",
                              value: "${widget.userData!.timing}",
                            ),
                            ResuableProfileTiles(
                              keys: "Days:",
                              value: "${widget.userData!.day}",
                            ),
                            ResuableProfileTiles(
                              keys: "Course:",
                              value: "${widget.userData!.program}",
                            ),
                            ResuableProfileTiles(
                              keys: "NIC Number:",
                              value: "${widget.userData!.cnic}",
                            ),
                            ResuableProfileTiles(
                              keys: "Father Number:",
                              value: "${widget.userData!.fphone}",
                            ),
                            ResuableProfileTiles(
                              keys: "Cell Number:",
                              value: "${widget.userData!.phone}",
                            ),
                            ResuableProfileTiles(
                              keys: "Address:",
                              value: "${widget.userData!.address}",
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