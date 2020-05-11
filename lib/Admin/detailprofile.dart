import 'package:flutter/material.dart';

class DetailProfile extends StatefulWidget {
  final List list;
  final int index;
  DetailProfile({this.list, this.index});
  @override
  _DetailProfileState createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Detail Profile")),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 130.0, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: new NetworkImage(
                                    "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DataTable(columns: [
                  DataColumn(
                    label: Text(''),
                  ),
                  DataColumn(
                    label: Text(''),
                  ),
                ], rows: [
                  DataRow(cells: <DataCell>[
                    DataCell(
                      Text(
                        'email',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.list[widget.index]['email'],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(
                      Text(
                        'username',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.list[widget.index]['username'],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(
                      Text(
                        'Hp',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.list[widget.index]['hp'],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(
                      Text(
                        'pembuatan akun',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        widget.list[widget.index]['datecreate'],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ]),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
