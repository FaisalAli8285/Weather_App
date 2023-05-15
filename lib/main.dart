import 'package:flutter/material.dart';
import 'package:weather_app/activity/loadin_activity.dart';

import 'activity/home_activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //    routes: {
    //   "/" : (context) => LoadingActivity(),
    //   "/home" : (context) => HomeActivity(),
    //   "/loading" : (context) => LoadingActivity(),
    // },
     
      debugShowCheckedModeBanner: false,
      home: LoadingActivity(),
    );
  }
}
