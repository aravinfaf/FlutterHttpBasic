import 'package:http/http.dart' as http;
import 'package:http_call/model/Post.dart';

class NetworkService {
  Future<List<Post>?> getPost() async {
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    }
  }
}
