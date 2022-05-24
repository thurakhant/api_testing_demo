import 'dart:convert';

import 'package:apitest/Models/UserModel.dart';
import 'package:apitest/example_three.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;

  Future<void> getUserApi() async {
    final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading');
                    } else {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  ReusableRow(title: 'Name', value: data[index]['name'].toString()),
                                  ReusableRow(title: 'Username', value: data[index]['username'].toString()),
                                  ReusableRow(title: 'Address', value: data[index]['address']['street'].toString()),
                                  ReusableRow(title: 'Geo', value: data[index]['address']['geo'].toString()),
                                  ReusableRow(title: 'Lat', value: data[index]['address']['geo']['lat'].toString()),
                                  ReusableRow(title: 'Lng', value: data[index]['address']['geo']['lng'].toString()),
                                ],
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }
}
