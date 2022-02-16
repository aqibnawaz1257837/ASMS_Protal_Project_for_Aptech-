import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/Models/user_data.dart';
import 'package:untitled/api.dart';
import 'package:http/http.dart' as http;

import '../Models/LoginData.dart';
class Service{



  static Future<dynamic> login(std_id,contact_no)async{

    var request = http.MultipartRequest('POST', Uri.parse('https://scrofulous-forms.000webhostapp.com/check_login.php'));
    request.fields.addAll({
      'phone_no': '${contact_no}',
      'student_id': '${std_id}'
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var responce=await response.stream.bytesToString();
      Map<String,dynamic> data=jsonDecode(responce);

      if(data['status']=="success")
      {

        LoginData loginData=loginDataFromJson(responce);
        return loginData;

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


  static Future<dynamic> fetch_std_data(std_id)async{

    var request = http.MultipartRequest('POST', Uri.parse('https://scrofulous-forms.000webhostapp.com/fetch_student_data.php'));
    request.fields.addAll({
      'student_id': '${std_id}'
    });
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var responce=await response.stream.bytesToString();
      Map<String,dynamic> data=jsonDecode(responce);

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

      Map<String,dynamic> data=jsonDecode(mresponce);

      print(mresponce.toString());
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


}