import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/main_work/worker.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  Worker worker = Worker(location: "Lahore");

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController;
  }

  void initState() {
    super.initState();
    worker.getData();
  }

  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue[600],
      ),
    );
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
//
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Colors.blue[700]!,
                      Colors.blue[300]!,
                    ])),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenHeight * 0.03),
                      margin: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            if ((searchController.text).replaceAll(" ", "") ==
                                "") {
                              print("blank");
                            } else {
                              performSearch();
                              print(worker.location);
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search_outlined,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenHeight * 0.02,
                        ),
                        Expanded(
                            child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Search ${(worker.location)}",
                            hintStyle: TextStyle(color: Colors.black),
                            border: InputBorder.none,
                          ),
                        ))
                      ]),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(screenHeight * 0.03),
                            margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.045),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.01)),
                            child: Row(
                              children: [
                                FutureBuilder<WeatherModel>(
                                  future: worker.getData(),
                                  builder: (context,
                                      AsyncSnapshot<WeatherModel> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator(); // show CircularProgressIndicator while waiting for response
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child: Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ));
                                    } else {
                                      return Image(
                                        image: NetworkImage(
                                            "https://openweathermap.org/img/wn/${snapshot.data!.weather![0].icon!}.png",
                                            scale: 0.5),
                                      );
                                    }
                                  },
                                ),
                                SizedBox(width: screenWidth * 0.08),
                                Column(
                                  children: [
                                    FutureBuilder<WeatherModel>(
                                      future: worker.getData(),
                                      builder: (context,
                                          AsyncSnapshot<WeatherModel>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator(); // show CircularProgressIndicator while waiting for response
                                        } else if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                            "Error",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ));
                                        } else {
                                          return Text(
                                            " ${(snapshot.data!.weather![0].description!)}",
                                          );
                                        }
                                      },
                                    ),
                                    FutureBuilder<WeatherModel>(
                                      future: worker.getData(),
                                      builder: (context,
                                          AsyncSnapshot<WeatherModel>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator(); // show CircularProgressIndicator while waiting for response
                                        } else if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                            "",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ));
                                        } else {
                                          return Text(
                                            "in ${(worker.location)}",
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.all(screenHeight * 0.03),
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.01)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            WeatherIcons.thermometer,
                            size: 39,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FutureBuilder<WeatherModel>(
                                future: worker.getData(),
                                builder: (context,
                                    AsyncSnapshot<WeatherModel> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator(); // show CircularProgressIndicator while waiting for response
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child: Text(
                                      "Error",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ));
                                  } else {
                                    return Row(
                                      children: [
                                        Text(
                                          " ${(snapshot.data!.main!.temp! - 273).toStringAsFixed(0)}",
                                          style: TextStyle(fontSize: 90),
                                        ),
                                        Text(
                                          "°C",
                                          style: TextStyle(fontSize: 60),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: screenWidth * 0.43,
                          height: screenHeight * 0.23,
                          padding: EdgeInsets.all(screenHeight * 0.03),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.01)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(WeatherIcons.day_windy),
                                  SizedBox(
                                    width: screenWidth * 0.035,
                                  ),
                                  Text(
                                    "wind speed",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.015,
                              ),
                              FutureBuilder<WeatherModel>(
                                future: worker.getData(),
                                builder: (context,
                                    AsyncSnapshot<WeatherModel> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator(); // show CircularProgressIndicator while waiting for response
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child: Text(
                                      "Error",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ));
                                  } else {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${(snapshot.data!.wind!.speed! / 0.27).toStringAsFixed(0)}",
                                          style: TextStyle(
                                              fontSize: 60,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Km/h",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.43,
                          height: screenHeight * 0.23,
                          padding: EdgeInsets.all(screenHeight * 0.03),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.01)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(WeatherIcons.humidity),
                                  SizedBox(
                                    width: screenWidth * 0.035,
                                  ),
                                  Text(
                                    "humidity",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.015,
                              ),
                              FutureBuilder<WeatherModel>(
                                future: worker.getData(),
                                builder: (context,
                                    AsyncSnapshot<WeatherModel> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator(); // show CircularProgressIndicator while waiting for response
                                  } else if (snapshot.hasError) {
                                    return Center(
                                        child: Text(
                                      "Error",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ));
                                  } else {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${(snapshot.data!.main!.humidity!).toStringAsFixed(0)}",
                                          style: TextStyle(
                                              fontSize: 60,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Percent",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(screenHeight * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Made By Faisal",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Data Provided By Openweathermap.org",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }

  searchFunction() {
    return searchController.text;
  }

  performSearch() {
    String query = searchController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        worker.location = query;
      });
      worker.getData();
    }
  }
}
