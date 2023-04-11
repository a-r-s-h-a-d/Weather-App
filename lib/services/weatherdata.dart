import 'dart:convert';

import 'package:weather_app/core/api/api_key.dart';
import 'package:weather_app/model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  Future<ModelWeather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$apikey&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return ModelWeather.fromJson(body);
  }
}
