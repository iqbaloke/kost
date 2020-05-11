import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kost/Admin/EditProduk.dart';
import 'package:kost/Modal/Api.dart';

class DetailProduk extends StatefulWidget {
  final List list;
  final int index;
  DetailProduk({this.list, this.index});
  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  void deleteData() {
    http.post(BaseUrl.delete, body: {
      'idproduk': widget.list[widget.index]['idproduk'],
    });
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are You delete'${widget.list[widget.index]['namaproduk']}'"),
      actions: <Widget>[
        new RaisedButton(
          onPressed: () {
            deleteData();
            Navigator.pop(context);
          },
          child: new Text("oke", style: TextStyle(color: Colors.white)),
          color: Colors.red,
        ),
        new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.blue,
          child: new Text(
            "batal",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text(
                  widget.list[widget.index]['namaproduk'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "Qty : ${widget.list[widget.index]['qty']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "harga : ${widget.list[widget.index]['harga']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "deskripsi : ${widget.list[widget.index]['deskripsi']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "username : ${widget.list[widget.index]['username']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "lokasi : ${widget.list[widget.index]['lokasi']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "No_hp : ${widget.list[widget.index]['no_hp']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Nama Pemilik : ${widget.list[widget.index]['nama_pemilik']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: () => Navigator.of(context).push(
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new EditProduk(
                                      list: widget.list,
                                      index: widget.index,
                                    ))),
                        child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        )),
                    RaisedButton(
                        onPressed: () {
                          setState(() {
                            confirm();
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
