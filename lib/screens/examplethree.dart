import 'dart:convert';
import 'package:api_tutorial/models/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Examplethree extends StatefulWidget {
  const Examplethree({Key? key}) : super(key: key);

  @override
  _ExamplethreeState createState() => _ExamplethreeState();
}

List<UserModel> Userlist = [];
Future<List<UserModel>> getUserApi() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      Userlist.add(UserModel.fromMap(i));
    }
    return Userlist;
  } else {
    return Userlist;
  }
}

class _ExamplethreeState extends State<Examplethree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Course example 3"),
      ),
      body: Column(children: [
        FutureBuilder(
            future: getUserApi(),
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return Expanded(
                child: ListView.builder(
                    // scrollDirection: Axis.vertical,
                    itemCount: Userlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ResusableRow(
                                  title: "Name",
                                  value: snapshot.data![index].name.toString())
                            ],
                          ),
                        ),
                      );
                    }),
              );
            })
      ]),
    );
  }
}

class ResusableRow extends StatelessWidget {
  String title, value;
  ResusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    );
  }
}
