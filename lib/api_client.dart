// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

class APIClient {
  void fetchData() async {
    var request = http.Request(
        'GET', Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
