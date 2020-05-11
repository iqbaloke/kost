import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kost/Modal/Api.dart';
import 'package:kost/Modal/Produkmodel.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  final ProdukModel model;
  const Edit(this.model);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _formKey = new GlobalKey<FormState>();
  String controllernamaproduk,
      controllerqty,
      controllerharga,
      controllerdeskripsi,
      controlleriduser;
  // TextEditingController controllernamaproduk = new TextEditingController();
  // TextEditingController controllerqty = new TextEditingController();
  // TextEditingController controllerharga = new TextEditingController();
  // TextEditingController controllerdeskripsi = new TextEditingController();
  // TextEditingController controlleriduser = new TextEditingController();

  TextEditingController txtnamaproduk, txtqty, txtharga, txtdeskripsi;
  setUp() {
    txtnamaproduk = TextEditingController(text: widget.model.namaproduk);
    txtqty = TextEditingController(text: widget.model.qty);
    txtharga = TextEditingController(text: widget.model.harga);
    txtdeskripsi = TextEditingController(text: widget.model.deskripsi);
  }

  check() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      submit();
    } else {}
  }

  submit() async {
    final response = await http.post(BaseUrl.update, body: {
      "idproduk": widget.model.idproduk,
      "namaproduk": controllernamaproduk,
      "qty": controllerqty,
      "harga": controllerharga,
      "deskripsi": controllerdeskripsi,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    int pesan = data['message'];
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formKey,
          child: Container(
            child: ListView(
              children: <Widget>[
                Form(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Edit Produk',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico"),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: txtnamaproduk,
                        onSaved: (e) => controllernamaproduk = e,
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'namaproduk',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          icon: Icon(Icons.add_box, color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: txtqty,
                        onSaved: (e) => controllerqty = e,
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'Qty',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          icon: Icon(Icons.high_quality,
                              color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: txtharga,
                        onSaved: (e) => controllerharga = e,
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'harga',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          icon:
                              Icon(Icons.event_busy, color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: txtdeskripsi,
                        onSaved: (e) => controllerdeskripsi = e,
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'deskripsi',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          icon:
                              Icon(Icons.description, color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 50),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          elevation: 5.0,
                          child: MaterialButton(
                            minWidth: 350.0,
                            height: 50.0,
                            color: Colors.blue,
                            onPressed: () {
                              setState(() {
                                // widget.reload();
                                // Navigator.pop(context);
                                check();
                              });
                              // upload(_image);
                            },
                            child: Text(
                              'Tambah Produk',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
