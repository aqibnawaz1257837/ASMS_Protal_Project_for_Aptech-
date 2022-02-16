import 'package:flutter/material.dart';
import 'package:untitled/Constraints/contraints.dart';

import 'DatePickers.dart';


class ShowAttendence extends StatefulWidget {
  const ShowAttendence({Key? key}) : super(key: key);

  @override
  _ShowAttendenceState createState() => _ShowAttendenceState();
}

class _ShowAttendenceState extends State<ShowAttendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Text("ASMS Portal" , style: KApppBarName,),
        centerTitle: true,
      ),


      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                DatePicker(
                  label: "Enter Start Date",
                  hint: "Start Date",
                ),
                SizedBox(width: 20,),

                DatePicker(
                  label: "Enter End Date",
                  hint: "End Date",
                ),
              ],
            ),
          ),


          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Card(
                          elevation: 2.0,
                          shadowColor: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Text("Date" , style: KProfileEmailText,),

                                Icon(Icons.check , color: Colors.green,)

                              ],
                            ),
                          ),

                        ),
                      ),
                    );

                  }

              ),
            ),
          ),



          Padding(
            padding: const EdgeInsets.only(left: 10.0 , right: 10.0),
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Row(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[

                        Text("Total Classes" ,style: KProfileEmailText,),
                        Text("Attend Classes" , style: KProfileEmailText,),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          )


        ],
      )
    );
  }
}


