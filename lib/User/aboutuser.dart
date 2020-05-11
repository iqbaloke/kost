import 'package:flutter/material.dart';

class AboutUser extends StatefulWidget {
  final VoidCallback signOut;
  AboutUser(this.signOut);
  @override
  _AboutUserState createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("About")),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        // color: Colors.black,
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(color: Colors.blue, blurRadius: 3.0)
                            ]),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.lock_open,
                                    size: 24,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    signOut();
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Keluar",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Pengaturan Aplikasi"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        // color: Colors.black,
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(color: Colors.blue, blurRadius: 3.0)
                            ]),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(
                                      Icons.info,
                                      size: 24,
                                      color: Colors.grey,
                                    ),
                                    onPressed: null),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Info Aplikasi",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        // color: Colors.black,
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(color: Colors.blue, blurRadius: 3.0)
                            ]),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(
                                      Icons.perm_device_information,
                                      size: 24,
                                      color: Colors.grey,
                                    ),
                                    onPressed: null),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Kebijakan Privasi",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )
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
