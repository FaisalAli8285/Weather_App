import 'package:flutter/material.dart';
import 'package:weather_app/activity/home_activity.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

class LoadingActivity extends StatefulWidget {
  const LoadingActivity({super.key});

  @override
  State<LoadingActivity> createState() => _LoadingActivityState();
}

class _LoadingActivityState extends State<LoadingActivity> {
  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeActivity(),));
    });
    
  }
  @override
  Widget build(BuildContext context) {
   // Map search = ModalRoute.of(context).settings.arguments;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue[700],
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: screenHeight*0.2,),
                Center(
                    child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    "assets/images/loading_logo.png",
                     height: screenHeight*0.65,
                     width: screenWidth*0.65,
                    fit: BoxFit.contain,
                  ),
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Text(
                    "Weather App",
                    style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Center(
                    child: Text("Made by FaisaL",
                        style: TextStyle(
                            fontSize: screenHeight * 0.019,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                 SpinKitWave(
                  color: Colors.white,
                  size: screenWidth*0.1,
                )
              ],
            ),
          )),
    );
  }
}
