import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';


// void main() => runApp(WaveDemoApp());

// class WaveDemoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wave Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: WaveDemoHomePage(),
//     );
//   }
// }

class WaveDemoHomePage extends StatefulWidget {

  @override
  _WaveDemoHomePageState createState() => _WaveDemoHomePageState();
}

class _WaveDemoHomePageState extends State<WaveDemoHomePage> {
  _buildCard({
    required Config config,
    Color backgroundColor = Colors.transparent,
    double height = 250.0,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      child: WaveWidget(
        config: config,
        backgroundColor: backgroundColor,
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 0,
      ),
    );
  }

  // MaskFilter? _blur;
  // final List<MaskFilter> _blurs = [
  //   MaskFilter.blur(BlurStyle.normal, 10.0),
  //   MaskFilter.blur(BlurStyle.inner, 10.0),
  //   MaskFilter.blur(BlurStyle.outer, 10.0),
  //   MaskFilter.blur(BlurStyle.solid, 16.0),
  // ];
  // int _blurIndex = 0;
  // MaskFilter _nextBlur() {
  //   if (_blurIndex == _blurs.length - 1) {
  //     _blurIndex = 0;
  //   } else {
  //     _blurIndex = _blurIndex + 1;
  //   }
  //   _blur = _blurs[_blurIndex];
  //   return _blurs[_blurIndex];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 16.0),

            _buildCard(
              backgroundColor: Color(0xFFFCAF17),
              config: CustomConfig(
                gradients: [
                  [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                  // [Colors.red, Color(0x77E57373)],


                  // [Colors.orange, Color(0x66FF9800)],
                  // [Colors.yellow, Color(0x55FFEB3B)]
                ],
                durations: [5000

                  // ,19440

                  // , 10800
                  // , 6000

                ],
                heightPercentages: [0.20
                  // , 0.23
                  // ,0.25

                  // , 0.30

                ],
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}