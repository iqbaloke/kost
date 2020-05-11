import 'package:flutter/material.dart';

class DetailKost extends StatefulWidget {
  final List list;
  final int index;
  DetailKost({this.list, this.index});
  @override
  _DetailKostState createState() => _DetailKostState();
}

class _DetailKostState extends State<DetailKost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kost ${widget.list[widget.index]['namaproduk']}"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            // padding: const EdgeInsets.all(20.0),
            // child: Card(
            child: Center(
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'http://192.168.43.88:8080/kost/image/' +
                          widget.list[widget.index]['image'],
                      height: 250,
                      width: 370,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20),
                    child: Column(
                      children: <Widget>[
                        new Text(
                          "Kost ${widget.list[widget.index]['namaproduk']}",
                          style: new TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
                            new Text(
                              "harga : ${widget.list[widget.index]['harga']}",
                              style: new TextStyle(
                                  fontSize: 12.0, color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Tentang Kost",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.query_builder),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                children: <Widget>[
                                  Text("17-07-2007",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.call,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                children: <Widget>[
                                  Text(widget.list[widget.index]['no_hp'],
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(widget.list[widget.index]['lokasi'],
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_city,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                children: <Widget>[
                                  Text(widget.list[widget.index]['deskripsi'],
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    widget.list[widget.index]['nama_pemilik'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    widget.list[widget.index]['fasilitas'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Card(
                    // color: Colors.blue.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Deskripsi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                widget.list[widget.index]['keterangan'],
                                style: TextStyle(fontSize: 12),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
