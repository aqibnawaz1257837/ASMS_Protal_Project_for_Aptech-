import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Constraints/contraints.dart';
import 'package:untitled/Models/LoginData.dart';
import 'package:untitled/Models/user_data.dart';
import 'package:untitled/Screens/DashBoard.dart';

import 'Service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController textEditingControllerID = TextEditingController();
  TextEditingController textEditingControllerPhoneNo = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  bool isLoading=false;

  LoginData? loginData;

   SharedPreferences? logindata;


  @override
  void initState() {
    // TODO: implement initState

    textEditingControllerID.text="Student1226122";
    textEditingControllerPhoneNo.text="3151234567";
    shareInit();
    super.initState();
  }

  shareInit() async{
    logindata = await SharedPreferences.getInstance();
   bool newuser = (logindata!.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => DashBaord()));
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF17),
        title: Text("ASMS Portal" , style: KApppBarName),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(

            children: <Widget>[



              Padding(
                padding: const EdgeInsets.only(top: 100.0 , bottom: 100.0),
                child: Container(
                  width: 250.0,
                  child: Hero(
                    tag: "hero",
                    child: Image(
                      image: AssetImage("images/Aptech Learning-03.png"),
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.amber[100],
                  //   borderRadius: BorderRadius.circular(10.0),
                  //   image: DecorationImage(
                  //     image: AssetImage("images/Aptech Learning-03.png"),
                  //   )
                  // ),
                ),
              ),

              SizedBox(
                height: 10.0,
              ),



              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: textEditingControllerID,
                    keyboardType: TextInputType.text,

                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: "Student ID",
                      hintText: "StudentXXXXXX",
                      labelStyle: TextStyle(fontSize: 20.0) ,
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 16.0 , color: Colors.redAccent) ,
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),

                  child: TextFormField(
                    controller: textEditingControllerPhoneNo,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "315XXXXXXX",
                      labelText: "Phone no",
                      labelStyle: TextStyle(fontSize: 20.0) ,
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(fontSize: 16.0 , color: Colors.redAccent) ,
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

              Container(
                width: 180.0,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFFFCAF17))
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
                    child: Text("Signin")),
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

        logindata!.setBool('login', false);
        logindata!.setString('id', loginData!.obj.stdid);
        Route route = MaterialPageRoute(builder: (_)=> DashBaord());
        Navigator.push(context, route);

      }

    });

  }
}
