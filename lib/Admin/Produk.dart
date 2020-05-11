import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:kost/Admin/AddProduk.dart';
import 'package:kost/Admin/DetailProduk.dart';
import 'package:kost/Modal/Api.dart';

class Produk extends StatefulWidget {
  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  Future<List> getData() async {
    final response = await http.get(BaseUrl.lihatproduk);
    return jsonDecode(response.body);
  }

  final GlobalKey<RefreshIndicatorState> _refresh =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Tambahproduk())),
      ),
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
                builder: (BuildContext context) => new DetailProduk(
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
                subtitle: new Text("harga : ${list[i]['harga']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
