import 'package:flutter/material.dart';
import 'package:untitled/Constraints/contraints.dart';

class ResuableProfileTiles extends StatelessWidget {

  final String keys;
  final String value;


  ResuableProfileTiles({required this.keys, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Card(
          elevation: 2.0,
          shadowColor: Color(0xFFFCAF17),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(keys , style: KProfileTileKEyName,),
                SizedBox(width: 8.0),
                Text(value ,style: KProfileTileValueName,),

              ],
            ),
          )),
    );
  }
}
