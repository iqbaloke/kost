import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kost/Modal/Api.dart';
import 'package:kost/Modal/Produkmodel.dart';
import 'package:http/http.dart' as http;
import 'package:kost/User/Kost/detailkost.dart';

class Kostterjangkau extends StatefulWidget {
  @override
  _KostterjangkauState createState() => _KostterjangkauState();
}

class _KostterjangkauState extends State<Kostterjangkau> {
  @override
  final list = new List<ProdukModel>();
  final GlobalKey<RefreshIndicatorState> _refresh =
      GlobalKey<RefreshIndicatorState>();
  var loading = false;

  Future<List> getData() async {
    final response = await http.get(BaseUrl.lihatprodukterjangkau);
    return jsonDecode(response.body);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kost Terjangkau")),
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
                builder: (BuildContext context) => new DetailKost(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['namaproduk']),
                leading: Image.network(
                  'http://192.168.43.88:8080/kost/image/' + list[i]['image'],
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                subtitle: new Text(
                    "harga : ${list[i]['harga']}\nLokasi : ${list[i]['lokasi']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
