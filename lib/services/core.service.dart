import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mynoteapp/models/Album.dart';

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
