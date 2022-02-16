import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/GetQrData.dart';
import 'package:untitled/Models/user_data.dart';
import 'package:untitled/Screens/DashBoard.dart';
import 'package:untitled/Screens/Service.dart';

class QRViewExample extends StatefulWidget {


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
  }

  @override
  Widget build(BuildContext context) {
    mc = context;

    nexScreen?Navigator.pop(context):null;
    return Scaffold(
      appBar: AppBar(title: Text("Scan Qr Code"),
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
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
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
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
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
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator()),
            ],
          ),
        );
      },

    );

  }

  void readData(QRViewController controller) {
    controller.scannedDataStream.first.then((value){
      print("fdf  ${value.code}");


      Map<String,dynamic> data=jsonDecode(value.code.toString());


      if(data.isNotEmpty) {
        getQrData = getQrDataFromJson(value.code.toString());


        print("sjsdhj  ${getQrData!.stdid[0]}  ${getQrData!.stdid[1]} ${id}");


        int count=0;
        for(int i=0;i<getQrData!.stdid.length;i++)
        {
          if (getQrData!.stdid[i] == id) {

            // Navigator.pop(context);
            showLoader();
            Service.insertAttendence(getQrData!.batchcode,getQrData!.stdid[i], getQrData!.book).then((value) {

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
    });
  }

}