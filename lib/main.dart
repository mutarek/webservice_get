import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}

class FirstPage extends StatefulWidget {
  _Staet createState() => _Staet();
}

class _Staet extends State<FirstPage> {
  @override
  initState() {
    getAllUsers();
    super.initState();
  }

  List users = [];
  bool isloading = false;

  Future<String> getAllUsers() async {
    setState(() => this.isloading = true);
    var respose = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    setState(() => users = json.decode(respose.body.toString()));
    setState(() => this.isloading = false);
    return 'geting errorr';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: this.isloading
            ? Center(
                child: CircularProgressIndicator(),
                heightFactor: 12.0,
              )
            : ListView.builder(
                itemCount: users == null ? 0 : users.length,
                itemBuilder: (ctx, ind) {
                  return Card(
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(users[ind]['name']),
                          Text(users[ind]['email']),
                          Text(users[ind]['username'])
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
