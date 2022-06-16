import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralApplicationList extends StatefulWidget {
  const GeneralApplicationList({Key? key}) : super(key: key);

  @override
  _GeneralApplicationListState createState() => _GeneralApplicationListState();
}

class _GeneralApplicationListState extends State<GeneralApplicationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFCAF17),
                  Colors.white54,

                ]),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ExpansionTile(
            title: Text("Subject"),
            subtitle: Text("data"),
            trailing: Text("Panding"),
            children: <Widget>[


              Text("Body"),


            ],
          ),
        ),
      );
    },);
  }
}
