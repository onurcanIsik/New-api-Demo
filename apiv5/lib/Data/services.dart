import 'dart:convert';

import 'package:apiv5/Model/model.dart';
import 'package:http/http.dart' as http;

class GetEvent {
  Future getEvent() async {
    var endpoint = Uri.parse("https://api.ubilisim.com/tarihtebugun/");
    var response = await http.get(endpoint);

    var body = jsonDecode(response.body);
    Iterable list = body['tarihtebugun'];
    List<Tarihtebugun> data =
        list.map((todo) => Tarihtebugun.fromJson(todo)).toList();

    return data;
  }
}
