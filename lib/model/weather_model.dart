
class WeatherModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherModel({this.coord, this.weather, this.base, this.main, this.visibility, this.wind, this.clouds, this.dt, this.sys, this.timezone, this.id, this.name, this.cod});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    if(json["coord"] is Map) {
      coord = json["coord"] == null ? null : Coord.fromJson(json["coord"]);
    }
    if(json["weather"] is List) {
      weather = json["weather"] == null ? null : (json["weather"] as List).map((e) => Weather.fromJson(e)).toList();
    }
    if(json["base"] is String) {
      base = json["base"];
    }
    if(json["main"] is Map) {
      main = json["main"] == null ? null : Main.fromJson(json["main"]);
    }
    if(json["visibility"] is int) {
      visibility = json["visibility"];
    }
    if(json["wind"] is Map) {
      wind = json["wind"] == null ? null : Wind.fromJson(json["wind"]);
    }
    if(json["clouds"] is Map) {
      clouds = json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]);
    }
    if(json["dt"] is int) {
      dt = json["dt"];
    }
    if(json["sys"] is Map) {
      sys = json["sys"] == null ? null : Sys.fromJson(json["sys"]);
    }
    if(json["timezone"] is int) {
      timezone = json["timezone"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["cod"] is int) {
      cod = json["cod"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(coord != null) {
      _data["coord"] = coord?.toJson();
    }
    if(weather != null) {
      _data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    _data["base"] = base;
    if(main != null) {
      _data["main"] = main?.toJson();
    }
    _data["visibility"] = visibility;
    if(wind != null) {
      _data["wind"] = wind?.toJson();
    }
    if(clouds != null) {
      _data["clouds"] = clouds?.toJson();
    }
    _data["dt"] = dt;
    if(sys != null) {
      _data["sys"] = sys?.toJson();
    }
    _data["timezone"] = timezone;
    _data["id"] = id;
    _data["name"] = name;
    _data["cod"] = cod;
    return _data;
  }
}

class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    if(json["type"] is int) {
      type = json["type"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["country"] is String) {
      country = json["country"];
    }
    if(json["sunrise"] is int) {
      sunrise = json["sunrise"];
    }
    if(json["sunset"] is int) {
      sunset = json["sunset"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["id"] = id;
    _data["country"] = country;
    _data["sunrise"] = sunrise;
    _data["sunset"] = sunset;
    return _data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    if(json["all"] is int) {
      all = json["all"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["all"] = all;
    return _data;
  }
}

class Wind {
  double? speed;
  int? deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    if(json["speed"] is double) {
      speed = json["speed"];
    }
    if(json["deg"] is int) {
      deg = json["deg"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["speed"] = speed;
    _data["deg"] = deg;
    return _data;
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    if(json["temp"] is double) {
      temp = json["temp"];
    }
    if(json["feels_like"] is double) {
      feelsLike = json["feels_like"];
    }
    if(json["temp_min"] is double) {
      tempMin = json["temp_min"];
    }
    if(json["temp_max"] is double) {
      tempMax = json["temp_max"];
    }
    if(json["pressure"] is int) {
      pressure = json["pressure"];
    }
    if(json["humidity"] is int) {
      humidity = json["humidity"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["temp"] = temp;
    _data["feels_like"] = feelsLike;
    _data["temp_min"] = tempMin;
    _data["temp_max"] = tempMax;
    _data["pressure"] = pressure;
    _data["humidity"] = humidity;
    return _data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["main"] is String) {
      main = json["main"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["icon"] is String) {
      icon = json["icon"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["main"] = main;
    _data["description"] = description;
    _data["icon"] = icon;
    return _data;
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    if(json["lon"] is double) {
      lon = json["lon"];
    }
    if(json["lat"] is double) {
      lat = json["lat"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lon"] = lon;
    _data["lat"] = lat;
    return _data;
  }
}