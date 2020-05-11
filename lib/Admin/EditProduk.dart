import 'package:flutter/material.dart';
import 'package:kost/Modal/Api.dart';
import 'package:http/http.dart' as http;

class EditProduk extends StatefulWidget {
  final List list;
  final int index;
  EditProduk({this.list, this.index});
  @override
  _EditProdukState createState() => _EditProdukState();
}

class _EditProdukState extends State<EditProduk> {
  final _formKey = new GlobalKey<FormState>();

  TextEditingController txtnama,
      txtharga,
      txtqty,
      txtdeskripsi,
      txtidproduk,
      txtlokasi,
      txtnohp,
      txtnamapemilik,
      txtketerangan,
      txtfasilitas;

  void update() {
    http.post(BaseUrl.update, body: {
      "idproduk": widget.list[widget.index]['idproduk'],
      "namaproduk": txtnama.text,
      "qty": txtqty.text,
      "harga": txtharga.text,
      "deskripsi": txtdeskripsi.text,
      "lokasi": txtlokasi.text,
      "no_hp": txtnohp.text,
      "nama_pemilik": txtnamapemilik.text,
      "keterangan": txtketerangan.text,
      "fasilitas": txtfasilitas.text,
    });
  }

  @override
  void initState() {
    txtnama = new TextEditingController(
        text: widget.list[widget.index]['namaproduk']);
    txtqty = new TextEditingController(text: widget.list[widget.index]['qty']);
    txtharga =
        new TextEditingController(text: widget.list[widget.index]['harga']);
    txtdeskripsi =
        new TextEditingController(text: widget.list[widget.index]['deskripsi']);
    txtlokasi =
        new TextEditingController(text: widget.list[widget.index]['lokasi']);
    txtnohp =
        new TextEditingController(text: widget.list[widget.index]['no_hp']);
    txtnamapemilik = new TextEditingController(
        text: widget.list[widget.index]['nama_pemilik']);
    txtketerangan = new TextEditingController(
        text: widget.list[widget.index]['keterangan']);
    txtfasilitas =
        new TextEditingController(text: widget.list[widget.index]['fasilitas']);
    super.initState();
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
                    child: Column(
                  children: <Widget>[
                    Text(
                      'Update Produk',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico"),
                    ),
                    SizedBox(
                      height: 75.0,
                    ),
                    TextFormField(
                      controller: txtnama,
                      // onSaved: (e) => namaproduk,
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
                      // onSaved: (e) => qty,
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
                        icon:
                            Icon(Icons.high_quality, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: txtharga,
                      // onSaved: (e) => harga,
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
                        icon: Icon(Icons.event_busy, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: txtdeskripsi,
                      // onSaved: (e) => deskripsi,
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
                        icon: Icon(Icons.description, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: txtlokasi,
                      // onSaved: (e) => deskripsi,
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'lokasi',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        icon: Icon(Icons.description, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: txtnohp,
                      // onSaved: (e) => deskripsi,
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'no_hp',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        icon: Icon(Icons.description, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: txtnamapemilik,
                      // onSaved: (e) => deskripsi,
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'namapemilik',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        icon: Icon(Icons.description, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: txtketerangan,
                      // onSaved: (e) => deskripsi,
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'keterangan',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        icon: Icon(Icons.description, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: txtfasilitas,
                      // onSaved: (e) => fastxtfasilitas,
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'fasilitas',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        icon: Icon(Icons.description, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        elevation: 5.0,
                        child: MaterialButton(
                          minWidth: 350.0,
                          height: 50.0,
                          color: Colors.blue,
                          onPressed: () {
                            update();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
