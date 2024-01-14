import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;

class RemoteServicesAddPrice{
  Future postDB(url, token, body)async{
    var headers = {
      'Content-Type': 'application/json',
      // ignore: unnecessary_brace_in_string_interps
      'Authorization': 'Bearer ${token}'
    };
    var request = http.Request('PUT', Uri.parse(url));
    request.body = json.encode(body);

    request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var json = await response.stream.bytesToString();
        return json;
      } else {
        return null;
      }
  }
}