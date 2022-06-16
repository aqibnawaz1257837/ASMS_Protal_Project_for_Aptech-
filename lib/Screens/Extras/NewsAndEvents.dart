import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Screens/Extras/DashBoardSlider.dart';
import 'package:untitled/demo/Demo.dart';



class NewsAndEvents extends StatefulWidget {
  const NewsAndEvents({Key? key}) : super(key: key);

  @override
  _NewsAndEventsState createState() => _NewsAndEventsState();
}

class _NewsAndEventsState extends State<NewsAndEvents> {


  @override
  Widget build(BuildContext context) {

    Demo? demo = Demo();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Text("ASMS Portal" , style: KApppBarName,),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            ClipPath(
              child: Container(
                height: 50.h,
                color: Color(0xFFFCAF17),
              ),
              clipper: CustomClipPath(),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25 , vertical: 5),
              child: Text("News And Events" , style: KNumberValue,),
            ),


            DashBoardSlider(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25 , vertical: 5),
              child: Text("Popular News And Events" , style: KNumberValue,),
            ),


            Container(
              height: 400,
              child: ListView.builder(
                itemCount: demo.images.length,
                  itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Image(
                                height:300,
                                width: double.infinity,
                                image: AssetImage("${demo.images[index]}") ,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("${demo.name[index]}" , style: TextStyle(
                                    color: Colors.black , fontWeight: FontWeight.bold ,fontSize: 18.0
                                  ),),
                                  Text("${demo.date[index]}",style: TextStyle(
                                      color: Colors.black , fontWeight: FontWeight.bold ,fontSize: 14.0
                                  ),),

                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              ),

                              Text("${demo.des[index]}",style: TextStyle(
                                  color: Colors.black , fontWeight: FontWeight.w400 ,fontSize: 14.0
                              ),),



                            ],
                          ),
                        ),
                      ),
                    );
                  },),
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