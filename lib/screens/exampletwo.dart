import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Exampletwo extends StatefulWidget {
  const Exampletwo({Key? key}) : super(key: key);

  @override
  _ExampletwoState createState() => _ExampletwoState();
}

List<Photos> photoslist = [];

Future<List<Photos>> getPhotos() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      Photos picture = Photos(title: i["title"], url: i["url"], id: i["id"]);
      photoslist.add(picture);
    }
    return photoslist;
  } else {
    return photoslist;
  }
}

class _ExampletwoState extends State<Exampletwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Course example 2"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  return ListView.builder(
                      itemCount: photoslist.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString())),
                          title: Text(snapshot.data![index].title.toString()),
                          subtitle: Text("Notes Id:" +
                              snapshot.data![index].id.toString()),
                        );
                      }));
                }),
          ),
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;
  Photos({required this.title, required this.id, required this.url});
}
