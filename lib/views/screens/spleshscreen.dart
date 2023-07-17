import 'dart:async';
import 'package:flutter/material.dart';

class spleshscreen extends StatefulWidget {
  const spleshscreen({Key? key}) : super(key: key);

  @override
  State<spleshscreen> createState() => _spleshscreenState();
}

class _spleshscreenState extends State<spleshscreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'introscreens');
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/2.png',
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Welcome To Recipes App",
                  style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 30),
                ),
              ),
              SizedBox(
                height:50,
              ),
              LinearProgressIndicator(color: Colors.deepOrangeAccent,),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
