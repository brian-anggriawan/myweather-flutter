import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.uri);

  String uri;
  Future get() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      // Response success
      return jsonDecode(response.body);
    } else {
      // Respone error
      return null;
    }
  }
}
