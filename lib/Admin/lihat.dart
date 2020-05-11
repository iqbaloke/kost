import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kost/Admin/AddProduk.dart';
import 'package:kost/Admin/Edit.dart';
import 'package:kost/Admin/EditProduk.dart';
import 'package:kost/Modal/Api.dart';
import 'package:kost/Modal/Produkmodel.dart';
import 'package:http/http.dart' as http;

class LihatProduk extends StatefulWidget {
  @override
  _LihatProdukState createState() => _LihatProdukState();
}

class _LihatProdukState extends State<LihatProduk> {
  final list = new List<ProdukModel>();
  final GlobalKey<RefreshIndicatorState> _refresh =
      GlobalKey<RefreshIndicatorState>();
  var loading = false;
  Future<void> _lihatData() async {
    list.clear();
    final response = await http.get(BaseUrl.lihatproduk1);
    if (response.contentLength == 2) {
    } else {
      final data = jsonDecode(response.body);
      data.forEach((api) {
        final ab = new ProdukModel(
          api['idproduk'],
          api['namaproduk'],
          api['qty'],
          api['harga'],
          api['deskripsi'],
          api['id_users'],
          api['datecreate'],
          api['username'],
          api['image'],
          api['lokasi'],
          api['no_hp'],
          api['nama_pemilik'],
        );
        list.add(ab);
      });
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _lihatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Tambahproduk())),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _lihatData,
              key: _refresh,
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final x = list[i];
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              'http://192.168.43.88:8080/kost/image/' + x.image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("nama Produk ${x.namaproduk}"),
                                  Text("qty ${x.qty}"),
                                  Text("harga ${x.harga}"),
                                  Text("deskripsi ${x.deskripsi}"),
                                  Text("username ${x.username}"),
                                  Text("waktu ${x.datecreate}"),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Edit(x)));
                              },
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: null)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
