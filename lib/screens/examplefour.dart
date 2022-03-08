import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example_four extends StatefulWidget {
  const Example_four({Key? key}) : super(key: key);

  @override
  State<Example_four> createState() => _Example_fourState();
}

var data;

class _Example_fourState extends State<Example_four> {
  Future<void> getUserApi() async {
    final Response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (Response.statusCode == 200) {
      data = jsonDecode(Response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Course example 4"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  } else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ResusableRow(
                                    title: 'Name',
                                    value: data[index]['name'].toString()),
                                ResusableRow(
                                    title: 'Username',
                                    value: data[index]['username'].toString()),
                                ResusableRow(
                                    title: 'Address',
                                    value: data[index]['address']['street']
                                        .toString()),
                                ResusableRow(
                                    title: 'geo',
                                    value: data[index]['address']['geo']['lng']
                                        .toString())
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
