import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mynoteapp/models/Album.dart';
import 'package:mynoteapp/models/Weather.dart';

String _api = "7e7949508f23f77b7dee1275906bb28f";

Future<Album> fetchAlbum(int id) async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/$id');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Weather> getWeatherData(String cityName) async {
  String api =
      "http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=7e7949508f23f77b7dee1275906bb28f";

  final response = await http.get(api);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Weather.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Something went wrong, check your city name.');
  }
}
