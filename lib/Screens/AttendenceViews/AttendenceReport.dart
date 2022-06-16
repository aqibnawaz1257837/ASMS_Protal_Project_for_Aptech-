import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/Service/Service.dart';

import '../../Constraints/contraints.dart';
import '../../Constraints/contraints.dart';


class AttendenceReport extends StatefulWidget {

  String stdid;

  AttendenceReport(this.stdid);

  @override
  State<AttendenceReport> createState() => _AttendenceReportState();
}

class _AttendenceReportState extends State<AttendenceReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Text("ASMS Portal" , style: KApppBarName,),



      ),

      body:FutureBuilder(
        future: Service.fetchAttStddata(widget.stdid),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {


        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError)
        {
          return Text("There is some error");
        }
        if(snapshot.hasData)
        {
          Map m=jsonDecode(snapshot.data);


          print(snapshot.data);
          print(m);
          List<dynamic> datal =m['obj'];

          print("dsfsd"+datal.length.toString());
          return  Center(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 10,left: 5),
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                    child: Text("Student Attendence Report" ,style: TextStyle(color: Colors.black , fontSize: 24 , fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            border: TableBorder.all(),
                            columnSpacing: 12,
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text('Status'),
                              ),

                              DataColumn(
                                label: Text('Date'),
                              ),
                              DataColumn(
                                label: Text('Check Time'),
                              ),
                              DataColumn(
                                label: Text('Class Timing'),
                              ),
                              DataColumn(
                                label: Text('Faculty'),
                              ),
                              DataColumn(
                                label: Text('Book Name'),
                              ),
                            ],
                            rows: [

                              for(int i=0;i<datal.length;i++)
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(datal[i]['status'] == '1' ? Icon(Icons.check , color: Colors.green,): Icon(Icons.clear , color: Colors.red,)),
                                    DataCell(Text(datal[i]['date'])),
                                    DataCell(Text(datal[i]['time'])),
                                    DataCell(Text(datal[i]['timing'])),
                                    DataCell(Text(datal[i]['faculty'])),
                                    DataCell(Text(datal[i]['book'])),
                                  ],
                                ),
                            ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },),

    );
  }
}
