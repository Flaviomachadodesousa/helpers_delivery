import 'package:http/http.dart' as http;
import 'dart:async';

const baseUrl =
    "https://minhasnotasfmu.000webhostapp.com/helpers/restaurantes.json";

class API {
  static Future getRestaurantes() async {
    var url = baseUrl;
    return await http.get(url);
  }
}
