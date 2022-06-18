import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/Models/user_data.dart';
import 'package:untitled/api.dart';
import 'package:http/http.dart' as http;

import '../Models/LoginData.dart';
class Service{


  static Future<dynamic> getmealsResponse() async{
    var request = http.Request('GET', Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=a'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return jsonDecode(res);

    }
    else {
      print(response.reasonPhrase);
      return "0";
    }

  }


  static Future<dynamic> login(std_id,contact_no)async{

    var request = http.MultipartRequest('POST', Uri.parse(loginApi),);
    request.fields.addAll({
      'phone_no': '${contact_no}',
      'student_id': '${std_id}'
    });
    request.headers.addAll({
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    });
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responce = await response.stream.bytesToString();
        Map<String, dynamic> data = json.decode(responce);

        if (data['status'] == "success") {
          LoginData loginData = loginDataFromJson(responce);
          return loginData;
        }
        else {
          return 0;
        }
        // print(await response.stream.bytesToString());
      }
      else {
        print("kajsdjsaj ${response.reasonPhrase}");
        return 0;
      }
    }
    catch (e){
      print("asasasa ${e.toString()}");
      return 0;
    }
  }




  static Future<dynamic> fetchAttStddata(std_id)async{

    var headers = {
      'Cookie': 'Cookie_1=value'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.0.203/appData/fetch_std_att_up.php'));
    request.fields.addAll({
      'student_id': '$std_id'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res=await response.stream.bytesToString();

      return res;
    }
    else {
      print(response.reasonPhrase);
    }

  }

  static Future<dynamic> fetch_std_data(std_id)async{

  try{
    var request = http.MultipartRequest('POST', Uri.parse(fetcStudentData));
    request.fields.addAll({
      'student_id': '${std_id}'
    });
    http.StreamedResponse response = await request.send();

    print(response.toString());
    if (response.statusCode == 200) {

      var responce=await response.stream.bytesToString();
      Map<String,dynamic> data=json.decode(responce);

      if(data['status']=="success")
      {

        UserData userData=userDataFromJson(responce);
        return userData;

      }
      else
      {
        return 0;

      }
      // print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
      return 0;
    }
  }
  catch(e)
  {
    print("${e}");
  }

  }


  static Future<dynamic> insertAttendence(batch_code,student_id,book)async{

    var request = http.MultipartRequest('POST', Uri.parse(mark_attendence));
    request.fields.addAll({
      'batch_code': batch_code,
      'student_id': student_id,
      'book': book
    });


    http.StreamedResponse response = await request.send();

    var mresponce=await response.stream.bytesToString();
    if (response.statusCode == 200) {

      Map<String,dynamic> data=json.decode(mresponce);

      print("ggaga ${mresponce.toString()}");
      if(data['status']=="success")
      {
        return 1;
      }
      else
      {
        return 0;
      }

    }
    else {
      print(response.reasonPhrase);
      return 0;

    }
  }


  static Future<dynamic> checkAttendence(student_id)async{

    var request = http.MultipartRequest('POST', Uri.parse('${check_attendence}'));
    request.fields.addAll({
      'student_id': '${student_id}'
    });



    http.StreamedResponse response = await request.send();

    var mresponce=await response.stream.bytesToString();
    if (response.statusCode == 200) {

      Map<String,dynamic> data=json.decode(mresponce);

      print("ggaga ${mresponce.toString()}");
      if(data['status']=="success")
      {
        return 1;
      }
      else
      {
        return 0;
      }

    }
    else {
      print(response.reasonPhrase);
      return 0;

    }
  }


  static Future<dynamic> checkDateTime(student_id)async{

    var request = http.MultipartRequest('POST', Uri.parse('${check_datetime}'));
    request.fields.addAll({
      'student_id': '${student_id}'
    });



    http.StreamedResponse response = await request.send();

    var mresponce=await response.stream.bytesToString();
    if (response.statusCode == 200) {

      Map<String,dynamic> data=json.decode(mresponce);

      print("ggaga ${mresponce.toString()}");
      if(data['status']=="error")
      {
        return 0;
      }
      else
      {
        return data['status'];
      }

    }
    else {
      print(response.reasonPhrase);
      return 0;

    }
  }


}