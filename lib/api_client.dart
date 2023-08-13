// ignore_for_file: avoid_print

import 'package:api_calling/post_model.dart';
import 'package:http/http.dart' as http;

class APIClient {
  Future<List<Posts>?> fetchData() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return postsFromJson(json);
    }
    return null;
  }
}
