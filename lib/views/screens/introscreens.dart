import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class introscreens extends StatefulWidget {
  const introscreens({Key? key}) : super(key: key);

  @override
  State<introscreens> createState() => _introscreensState();
}

class _introscreensState extends State<introscreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            body:
                "There are wide rang of food item available in this. You can choose what you like.",
            title: "Choose your Favorite food",
            image: Image.asset('assets/images/2.png'),
          ),
          PageViewModel(
              body:
                  "It is very easy way to get food where you live when you put your home address",
              title: "Enter your Address",
              image: Image.asset('assets/images/3.png')),
          PageViewModel(
            body: "We provide fastest delivery at your home to when you need food",
            title: "Get your food at doorstep",
            image: Image.asset('assets/images/1.png'),
          ),
        ],
        done: Text(
          "Thank You",
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
        showNextButton: false,
        onDone: () {
          Navigator.of(context).pushNamed("/");
        },
      ),
    );
  }
}
