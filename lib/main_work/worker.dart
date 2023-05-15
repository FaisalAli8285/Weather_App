import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class Worker {
  String location;
  Worker({required this.location}) {
    location = this.location;
  }

  Future<WeatherModel> getData() async {
    // try {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=259312d1c89e9e0c54bf32e94bae7f90"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      return WeatherModel.fromJson(data);
    } else {
      throw Exception("");
    }
    //}
    //    catch (e) {
    //     print(e);
    //     // throw Exception("Error fetching data: $e");
    //     throw Exception("NA");

    //   }
    // }
//}
  }
}
