import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Service/Service.dart';
import 'package:untitled/demo/Demo.dart';

class DashBoardSlider extends StatefulWidget {

  @override
  _DashBoardSlider createState() => _DashBoardSlider();
}

class _DashBoardSlider extends State<DashBoardSlider> {


  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageVale = 0.0;
  double _ScaleFactor = 0.8;
  double _height = 220;
  Demo? demo = Demo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageVale = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 220,
          child: PageView.builder(
            itemCount: demo!.images.length,
            controller: pageController,
            itemBuilder: (context , position){
              return _buildPageItem(position);
            },),
        ),
        new DotsIndicator(
          dotsCount: demo!.images.length,
          position: _currentPageVale,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: Colors.black,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

      ],
    );

  }
  Widget _buildPageItem(int index){

    Matrix4 matrix4 = new Matrix4.identity();

    if(index == _currentPageVale.floor()){
      var currScale = 1-(_currentPageVale-index)*(1-_ScaleFactor);
      var currTranfer = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTranfer, 0);
    }else if(index == _currentPageVale.floor()+1){
      var CurrScale = _ScaleFactor+(_currentPageVale-index+1)*(1-_ScaleFactor);
      var currTranfer = _height*(1-CurrScale)/2;

      matrix4 = Matrix4.diagonal3Values(1, CurrScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, CurrScale, 1)..setTranslationRaw(0, currTranfer, 0);


    }else if(index == _currentPageVale.floor()-1){
      var currScale = 1-(_currentPageVale-index)*(1-_ScaleFactor);
      var currTranfer = _height*(1-currScale)/2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTranfer, 0);
    }else{

      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_ScaleFactor)/2, 1);

    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: <Widget>[

          Container(
            height: 200,
            margin: EdgeInsets.only(left:10, right: 10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5,0),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(

                    fit: BoxFit.cover,
                    image: AssetImage("${demo!.images[index]}")
                )
            ),
          ),

        ],
      ),
    );
  }
}

