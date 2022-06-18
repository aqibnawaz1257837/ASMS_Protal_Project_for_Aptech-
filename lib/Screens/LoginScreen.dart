import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Models/LoginData.dart';
import 'package:untitled/Models/user_data.dart';
import 'package:untitled/Screens/DashBoard.dart';

import '../Service/Service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController textEditingControllerID = TextEditingController();
  TextEditingController textEditingControllerPhoneNo = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  bool isLoading=false;

  LoginData? loginData;

   SharedPreferences? storelogindata;


  @override
  void initState() {
    // TODO: implement initState

    textEditingControllerID.text="Student1194778";
    textEditingControllerPhoneNo.text="923118471069";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, designSize:  Size(320,600),minTextAdapt: true);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Text("ASMS Portal" , style: KApppBarName),


        toolbarHeight: 44.h,

      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(

            children: <Widget>[



              Padding(
                padding: EdgeInsets.only(top: 50.h , bottom: 50.h),
                child:Image(
                  image: AssetImage("images/Aptech Learning-03.png" ),
                  fit: BoxFit.fill,
                  height: 100.h,
                  width: 220.w,
                ),
              ),

              SizedBox(
                height: 10.w,
              ),



              Container(
                height: 60.h,

                child: Padding(
                  padding: EdgeInsets.only(top:10.h , right: 10.w , left: 10.w),
                  child: TextFormField(
                    controller: textEditingControllerID,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 14.sp),
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: "Student ID",
                      hintText: "StudentXXXXXX",
                      hintStyle:TextStyle(fontSize: 14.sp),

                      labelStyle: TextStyle(fontSize: 14.sp) ,
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 14.sp , color: Colors.redAccent) ,
                    ),


                    validator: (value){

                      if(value == null || value.isEmpty || !value.contains("Student")){

                        return "PLease Enter the Student id";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),
              ),

              Container(
                height: 60.h,

                child: Padding(
                  padding: EdgeInsets.only(top:10.h , right: 10.w , left: 10.w),

                  child: TextFormField(
                    controller: textEditingControllerPhoneNo,
                    style: TextStyle(fontSize: 14.sp),
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "315XXXXXXX",
                      hintStyle:TextStyle(fontSize: 14.sp),
                      labelText: "Phone no",
                      labelStyle: TextStyle(fontSize: 14.sp) ,
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 14.sp , color: Colors.redAccent) ,
                    ),

                    validator: (value){

                      if(value == null || value.isEmpty){

                        return "PLease Enter the Phone no";
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),
              ),


              SizedBox(
                height: 20.h,
              ),

              Container(
                width: 180.w,
                height: 35.h,
                child: ElevatedButton(
                    style: ButtonStyle(

                        backgroundColor: MaterialStateProperty.all(Color(0xFFFCAF17)),
                    ),
                    onPressed: (){


                      // Route route = MaterialPageRoute(builder: (_)=> DashBaord());
                      // Navigator.push(context, route);

                      // if(textEditingControllerEmail == "" || textEditingControllerPass == ""){
                      //
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some Error")));
                      //
                      // }
                      // else
                      // {
                      //   apiCall("","");
                      // }

                      if(_formKey.currentState!.validate())
                      {
                        apiCall(textEditingControllerID.text.trim(),textEditingControllerPhoneNo.text.trim());
                      }



                    },
                    child: Text("Signin" , style: TextStyle(fontSize: 14.sp),)),
              ),

              Visibility(
                  visible: isLoading,
                  child: CircularProgressIndicator())




            ],
          ),
        ),
      ),
    );
  }

  void toast(String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${s}")));
  }

  void apiCall(String std_id, String phoneno) {
    setState(() {
      isLoading=true;
    });
    //"Student1226122"
    //3151234567
    Service.login(std_id,phoneno).then((value) {

      setState(() {
        isLoading=false;
      });
      if(value==0)
      {
        toast("Invalid Credentials");
      }
      else
      {
        loginData=value;

        print(loginData!.obj.stdid);

        setData(loginData!.obj.stdid).then((value) {

          Route route = MaterialPageRoute(builder: (_)=> DashBaord());
          Navigator.pushReplacement(context, route);

        });

      }
    });
  }
  Future<void> setData(id)async{

    storelogindata = await SharedPreferences.getInstance();

   await storelogindata!.setBool('login', false);
   await storelogindata!.setString('id', loginData!.obj.stdid);
  }
}
