import 'package:flutter/material.dart';
import 'package:ilearn/Login.dart';
import 'package:ilearn/mainActivity.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnBoarding extends StatefulWidget {
  OnBoarding({Key key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

final introKey = GlobalKey<IntroductionScreenState>();
void _onIntroEnd(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Login()));
}

class _OnBoardingState extends State<OnBoarding> {
  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/image/$assetName', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.red),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Container(
        child: IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "iLearn BootCamp",
          body:
              "you put your text here boss.  I am waiting for you to learn.\nNo more phobia for learning in becoming a brilliant person",
          image: _buildImage('splash.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn with Professionals",
          body:
              "you put your text here boss.   I am waiting for you to learn.\nNo more phobia for learning in becoming a brilliant person",
          image: _buildImage('img1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Experts and Learners",
          footer: IconButton(
              icon: Icon(
                Icons.shutter_speed,
              ),
              onPressed: null),
          body:
              "you put your text here boss.   I am waiting for you to learn.\nNo more phobia for learning in becoming a brilliant person",
          image: _buildImage('img2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Sure for you",
          body:
              "you put your text here boss.   I am waiting for you to learn.\nNo more phobia for learning in becoming a brilliant person",
          image: _buildImage('img3.png'),
          footer: IconButton(
              icon: Icon(
                Icons.shutter_speed,
              ),
              onPressed: null),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Moderate",
          footer: IconButton(
              icon: Icon(
                Icons.shutter_speed,
              ),
              onPressed: null),
          body:
              "you put your text here boss.   I am waiting for you to learn.\nNo more phobia for learning in becoming a brilliant person",
          image: _buildImage('img3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(color: Colors.red),
      ),

      next: const Icon(
        Icons.arrow_forward,
        color: Colors.red,
      ),
      done: const Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        activeColor: Colors.white,
        color: Colors.blue,
        activeSize: Size(18.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    ));
  }
}
