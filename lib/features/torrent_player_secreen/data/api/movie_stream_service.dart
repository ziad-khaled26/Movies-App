import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieStreamService {
  String myLocalHost = "192.168.1.13:4000";
  String startTaskEndPoint = "/api/movies/start";
  String getStatusEndPoint = "/api/movies/status";

  Future<String> startTorrent(String torrentUrl) async {
    Uri url = Uri.http(myLocalHost, startTaskEndPoint);
    http.Response response = await http.post(
      url,
      body: jsonEncode({"torrentUrl": torrentUrl}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to start torrent: ${response.body}');
    }

    var json = jsonDecode(response.body);
    String taskId = json["taskId"];
    return taskId;
  }

  Future<Map<String, dynamic>> getStatus(String taskId) async {
    http.Response response = await http.get(
      Uri.parse("http://$myLocalHost$getStatusEndPoint/$taskId"),
    );
    if (response.statusCode != 200) {
      throw Exception('Status error: ${response.body}');
    }
    final json = jsonDecode(response.body);
    return json;
  }

  Future<String>waitUntilReady(String taskId) async {
    while(true){
      var response = await getStatus(taskId);
      var state = response["status"] as String;
      if (state == "ready_to_stream") {
        final streamUrl = response["streamUrl"] as String?;
        if (streamUrl == null) {
          throw Exception('ready_to_stream but no streamUrl in response');
        }
        else if (state == 'error') {
          throw Exception('Server error: ${response['error']}');
        }
        return "http://$myLocalHost$streamUrl";
      }
      await Future.delayed(const Duration(seconds: 2));
    }
  }
}
