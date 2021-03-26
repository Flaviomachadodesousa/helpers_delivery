import 'package:http/http.dart' as http;
import 'dart:async';

const baseUrlPerfil =
    "https://minhasnotasfmu.000webhostapp.com/helpers/perfil.json";

class APIPerfil {
  static Future getPerfil() async {
    var url = baseUrlPerfil;
    return await http.get(url);
  }
}
