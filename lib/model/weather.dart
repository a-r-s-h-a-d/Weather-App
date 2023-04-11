// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelWeather {
  var cityname;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var winddir;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var lastupdate;
  ModelWeather({
    required this.cityname,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.winddir,
    required this.gust,
    required this.uv,
    required this.pressure,
    required this.pricipe,
    required this.lastupdate,
  });

  ModelWeather.fromJson(Map<String, dynamic> json) {
    cityname = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    winddir = json['current']['wind_dir'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
    pressure = json['current']['pressure_mb'];
    pricipe = json['current']['precip_mm'];
    lastupdate = json['current']['last_updated'];
  }
}
