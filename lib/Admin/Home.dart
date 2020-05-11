import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kost/Modal/Api.dart';
import 'package:kost/User/Kost/Kostmahal.dart';
import 'package:kost/User/Kost/Kostsedang.dart';
import 'package:kost/User/Kost/Kostterjangkau.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    final response = await http.get(BaseUrl.lihatproduk);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "FOTO LOGO",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "KATA-KATA",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35)),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "KATEGORI KOST PALEMBANG",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Card(
                                child: Container(
                                  height: 150,
                                  width: 120,
                                  color: Colors.blue.withOpacity(0.7),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: Colors.blue,
                                        child: IconButton(
                                          padding: EdgeInsets.all(15.0),
                                          icon: Icon(Icons.send),
                                          color: Colors.white,
                                          iconSize: 30.0,
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Kostterjangkau()));
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Center(
                                        child: Text('Kost Harga\nTerjangkau',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Card(
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 150,
                                    width: 120,
                                    color: Colors.blue.withOpacity(0.7),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          color: Colors.blue,
                                          child: IconButton(
                                            padding: EdgeInsets.all(15.0),
                                            icon: Icon(Icons.credit_card),
                                            color: Colors.white,
                                            iconSize: 30.0,
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Kostsedang()));
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text('Kost Harga\n6-10 jt',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, bottom: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Card(
                              child: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 150,
                                  width: 120,
                                  color: Colors.blue.withOpacity(0.7),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Material(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        // color: Colors.blue.withOpacity(0.1),
                                        color: Colors.blue,
                                        child: IconButton(
                                          padding: EdgeInsets.all(15.0),
                                          icon: Icon(Icons.credit_card),
                                          color: Colors.white,
                                          iconSize: 30.0,
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        KostMahal()));
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Center(
                                        child: Text('Kost 10jt Keatas',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
