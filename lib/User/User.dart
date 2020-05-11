import 'package:flutter/material.dart';

class User extends StatefulWidget {
  final VoidCallback signOut;
  User(this.signOut);
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                widget.signOut();
              });
            },
            icon: Icon(Icons.lock_open),
          ),
        ],
      ),
      body: Center(
        child: Text("wellcome User"),
      ),
    );
  }
}
