import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/GetQrData.dart';
import 'package:untitled/Models/user_data.dart';
import 'package:untitled/Screens/DashBoard.dart';
import 'package:untitled/Service/Service.dart';

class
QRViewExample extends StatefulWidget {
  Obj? userData;
  QRViewExample(this.userData);



  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  GetQrData? getQrData;

  BuildContext? mc;
  bool nexScreen = false;
  var id="0";


  SharedPreferences? logindata;

  SharedPreferences? storeOfDate;


  getId()async{
      logindata = await SharedPreferences.getInstance();
     id = (logindata!.getString('id') ?? "0");
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
    // print(myData(
    //     "[59,173,83,88,148,148,165,149,155,88,108,90,129,132,96,98,107,99,101,152,94,99,120,94,103,120,90,93,82,90,147,161,162,156,89,109,88,127,134,94,161,153,151,155,150,150,89,95,81,89,151,146,166,152,88,108,90,98,107,96,98,107,96,99,98,99,97,89,95,81,89,166,165,167,151,150,160,167,144,155,151,88,82,109,140,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,88,133,167,166,150,152,159,166,100,98,105,103,102,104,108,88,94,90,132,166,168,149,151,161,165,99,100,104,102,104,103,107,90,93,89,134,165,167,151,150,160,167,98,99,106,101,103,105,106,89,95,142,82,176]",
    //     "123"
    // ));
  }

  @override
  Widget build(BuildContext context) {
    mc = context;

    nexScreen?Navigator.pop(context):null;


    return Scaffold(
      appBar: AppBar(title: Text("Scan Qr Code"),
        backgroundColor: Color(0xFFFCAF17),
        toolbarHeight: 44.h,

        actions: [
        IconButton(onPressed: ()async{
          await controller?.flipCamera();

        }, icon: Icon(Icons.switch_camera)),

        IconButton(onPressed: ()async{
          await controller?.toggleFlash();

          setState(() {});
        }, icon: FutureBuilder(
          future: controller?.getFlashStatus(),
          builder: (context, snapshot) {
            if (snapshot.data==true) {
              return Icon(Icons.flashlight_on);
            } else {
              return  Icon(Icons.flashlight_off);
            }
            },
        )
        ),
      ],),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),

        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400.w ||
        MediaQuery.of(context).size.height < 400.w)
        ? 350.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: (QRViewController controller)
      {
        this.controller=controller;


        readData(controller);

      },
      overlay: QrScannerOverlayShape(
          borderColor: Colors.green,
          borderRadius: 10.r,
          borderLength: 30.h,
          borderWidth: 10.w,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  exitScreen()
  {
  Navigator.of(mc!).push(MaterialPageRoute(builder: (_)=>
      DashBaord()));

  }
  void toast(String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${s}")));
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    print("dskljdslkjsdflk");
    controller?.dispose();
    super.dispose();
  }

  showDialod(s){

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Mark Attendance"),
          content: Text("${s}"),
          actions: [

            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],
        );
      },

    );

  }

  showLoader(){

    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (context) {
        return AlertDialog(
          title: Text("Please Wait"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 50.w,
                  height: 50.h,
                  child: CircularProgressIndicator()),
            ],
          ),
        );
      },

    );

  }
  myData(content,String passcode) {
    var result = [];var str = '';

    var codesArr = json.decode(content);

    var passLen = passcode.length ;

    for(var i = 0  ; i < codesArr.length ; i++) {
      var passOffset = i%passLen ;

      var calAscii = (codesArr[i]-passcode.codeUnitAt(passOffset));
      result.add(calAscii) ;
    }
    for(var i = 0 ; i < result.length ; i++) {
      var ch = String.fromCharCode(result[i]); str += ch ;
    }
    return str ;
  }

  myEncrpyt(content) {
    var result = [];
    var resultasci = [];

    var str = '';

    // var codesArr = json.decode(content);


    for(var i = 0  ; i < content.codeUnits.length ; i++) {
      var calAscii = (content.codeUnits[i]-2);
      result.add(calAscii) ;
    }
    for(var i = 0 ; i < result.length ; i++) {
      var ch = String.fromCharCode(result[i]);
      str += ch ;
    }
    return str ;
  }
  void readData(QRViewController controller) {
    controller.scannedDataStream.first.then((value)async {
      print("fdf  ${value.code}");


      Map<String,dynamic> data=jsonDecode(await myEncrpyt(value.code.toString()));

      print("fdfsd  ${data.toString()}");
      if(data.isNotEmpty) {

        print(myEncrpyt(value.code.toString()));
        getQrData = getQrDataFromJson(await myEncrpyt(value.code.toString()));


        print("sjsdhj  ${getQrData}  ");


        int count=0;
        for(int i=0;i<getQrData!.stdid.length;i++)
        {
          if (getQrData!.stdid[i] == widget.userData!.id) {

            // Navigator.pop(context);
            showLoader();
            Service.insertAttendence(widget.userData!.batch,widget.userData!.stdid, getQrData!.book).then((value) {

              print("dfdffdfdfdfd ${value}");

              if(value==1)
              {
                toast("Success");
                Navigator.of(context).pop();
                Navigator.of(context).pop();


                showDialod("Mark Attendence Successfully");


              }
              else
              {

                toast("Failed");
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                showDialod("Try Again Something wrong");

              }


            });
            break;
          }
          if(i+1==getQrData!.stdid.length)
          {
            print("dssd${i}");
            toast("Student Id Not Found");
            Navigator.pop(context);
          }

        }
        // getQrData!.stdid.forEach((element) {
        //   count++;
        //   // showLoader();
        //   if (element.toString().trim() == id) {
        //
        //     // Navigator.pop(context);
        //     showLoader();
        //     Service.insertAttendence("batch_code", "student_id", "book").then((value) {
        //
        //       print("dfdffdfdfdfd ${value}");
        //
        //       if(value==1)
        //       {
        //         toast("Success");
        //         Navigator.of(context).pop();
        //         Navigator.of(context).pop();
        //         showDialod("Mark Attendence Successfully");
        //         return;
        //
        //       }
        //       else
        //       {
        //
        //         toast("Failed");
        //         Navigator.of(context).pop();
        //         Navigator.of(context).pop();
        //         showDialod("Try Again Something wrong");
        //         return;
        //
        //       }
        //
        //
        //     });
        //   }
        //   if(count<getQrData!.stdid.length)
        //   {
        //     print("dssd${count}");
        //     toast("Student Id Not Found");
        //     Navigator.pop(context);
        //   }
        // });


      }
      else{
        toast("Something Wrong ");
      }
    });
  }
//   Future<void> setData(id)async{
//
//     var now = new DateTime.now();
//     var formatter = new DateFormat('yyyy-MM-dd');
//     String formattedDate = formatter.format(now);
// print("save date ${formattedDate}");
//
//     storeOfDate = await SharedPreferences.getInstance();
//
//     await storeOfDate!.setString('currDate', formattedDate);
//     print("save date ${storeOfDate!.getString("currDate")}");
//
//
//   }
}