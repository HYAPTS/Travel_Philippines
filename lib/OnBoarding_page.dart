
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:travel_blog/home.dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset('assets/images/MainpicOn.jpg',
    fit: BoxFit.fitWidth,
     height: double.infinity,
    width: double.infinity,
      alignment: Alignment.center,
    );
  }
 Widget _buildImage(String assetName, [double width = 350,double height =1000]) {
    return Image.asset('assets/images/$assetName', width: width,height:height,alignment: Alignment.bottomCenter);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(80.0,100.0, 70.0, 50.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.all(8.0),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,  
      ),   
      pages: [
         PageViewModel(
          title: "7,641 Islands ",
          body:
              "Experience a safe and fun-filled holiday in one of our 7,641 islands.",
          image: _buildImage('MainpicOn.jpg',),
          
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Book the Flight",
          body:
              "schedule more and choose our best top destinations.",
          image: _buildImage('onb1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Connect With tourist",
          body:
              "Connect with people of faith locally & globally.",
          image: _buildImage('onpic4.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Discover new things",
          body: "Explore new things through our app Discover initiary & other stuffs",
          image: _buildImage('onpic5.jpg'),
          
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Share your moments",
          body: "Share you trip initiary with others. Let's make the travel fun & enoyable",
          image: _buildImage('onpic7.jpg'),
          
          decoration: pageDecoration,
        ),
       
      ],
      onDone: () => _onIntroEnd(context),
       // can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFF50057),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
