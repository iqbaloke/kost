import 'dart:io';
// import 'dart:async.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kost/Modal/Api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

class Tambahproduk extends StatefulWidget {
  @override
  _TambahprodukState createState() => _TambahprodukState();
}

class _TambahprodukState extends State<Tambahproduk> {
  final _formKey = new GlobalKey<FormState>();
  // File _imageFile;
  TextEditingController controllernamaproduk = new TextEditingController();
  TextEditingController controllerqty = new TextEditingController();
  TextEditingController controllerharga = new TextEditingController();
  TextEditingController controllerdeskripsi = new TextEditingController();
  TextEditingController controlleriduser = new TextEditingController();
  TextEditingController controllerlokasi = new TextEditingController();
  TextEditingController controllernohp = new TextEditingController();
  TextEditingController controllernamapemilik = new TextEditingController();
  TextEditingController controllerketerangan = new TextEditingController();
  TextEditingController controllerlevel = new TextEditingController();
  TextEditingController controllerfasilitas = new TextEditingController();
  String email = "", username = "", id_user = "";

  TabController tabController;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString("email");
      username = preferences.getString("username");
      id_user = preferences.getString("id_user");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  File _image;
  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = imageFile;
    });
  }

  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = imageFile;
    });
  }

  Future upload(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse(BaseUrl.addproduk);
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));
    request.fields['namaproduk'] = controllernamaproduk.text;
    request.fields['qty'] = controllerqty.text;
    request.fields['harga'] = controllerharga.text;
    request.fields['id_users'] = controlleriduser.text = "$id_user";
    request.fields['deskripsi'] = controllerdeskripsi.text;
    request.fields['lokasi'] = controllerlokasi.text;
    request.fields['no_hp'] = controllernohp.text;
    request.fields['nama_pemilik'] = controllernamapemilik.text;
    request.fields['keterangan'] = controllerketerangan.text;
    request.fields['level'] = controllerlevel.text;
    request.fields['fasilitas'] = controllerfasilitas.text;
    request.files.add(multipartFile);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("upload success");
    } else {
      print("Upload failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tambah Produk")),
      ),
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
                        'Tambah Produk',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico"),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: _image == null
                            ? new Text("tidak ada gambar")
                            : new Image.file(_image),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 85),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: getImageGallery,
                                  child: Icon(Icons.image),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: getImageCamera,
                                  child: Icon(Icons.camera),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: controllernamaproduk,
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
                        controller: controllerqty,
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
                        controller: controllerharga,
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
                        controller: controllerdeskripsi,
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
                      TextFormField(
                        controller: controllerlokasi,
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'Lokasi',
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
                      TextFormField(
                        controller: controllernohp,
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'No_hp',
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
                      TextFormField(
                        controller: controllernamapemilik,
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'nama_pemilik',
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
                      TextFormField(
                        controller: controllerketerangan,
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
                          icon:
                              Icon(Icons.description, color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: controllerlevel,
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'level',
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
                      TextFormField(
                        controller: controllerfasilitas,
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
                                Navigator.pop(context);
                              });
                              upload(_image);
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
