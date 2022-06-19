import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_call/model/Post.dart';
import 'package:http_call/network/NetworkService.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoaded = false;
  List<Post>? post;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    post = await NetworkService().getPost();
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: post?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: Text(
                            post![index].title.substring(0, 1),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            post![index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 20,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.grey,
                    ),
                  )
                ],
              );
            }),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
