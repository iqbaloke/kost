import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailUser extends StatefulWidget {
  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  String email = "", username = "", hp = "", datecrate = "";

  TabController tabController;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString("email");
      username = preferences.getString("username");
      hp = preferences.getString("hp");
      datecrate = preferences.getString("datecrate");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

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
                        '$email',
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
                        '$username',
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
                        '$hp',
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
                        '$datecrate',
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
