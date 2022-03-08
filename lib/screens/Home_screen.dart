import 'dart:convert';
import 'package:api_tutorial/models/postmodels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  List<Postmodels> postlist = [];
  Future<List<Postmodels>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postlist.add(Postmodels.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Course"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading");
                  } else {
                    return ListView.builder(
                        itemCount: postlist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ID:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(postlist[index].id.toString()),
                                Text(
                                  "Title:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(postlist[index].title.toString()),
                                Text(
                                  "Description:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(postlist[index].body.toString())
                              ],
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
