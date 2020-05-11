import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kost/Admin/detailprofile.dart';
import 'package:kost/Modal/Api.dart';
import 'package:http/http.dart' as http;

class Tampilan extends StatefulWidget {
  @override
  _TampilanState createState() => _TampilanState();
}

class _TampilanState extends State<Tampilan> {
  Future<List> getData() async {
    final response = await http.get(BaseUrl.lihatuser);
    return jsonDecode(response.body);
  }

  final GlobalKey<RefreshIndicatorState> _refresh =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: getData,
        key: _refresh,
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailProfile(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['username']),
                leading: Icon(Icons.person),
                subtitle: new Text("email : ${list[i]['email']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
