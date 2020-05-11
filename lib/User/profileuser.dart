import 'package:flutter/material.dart';
import 'package:kost/User/detailuser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileUser extends StatefulWidget {
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  String email = "", username = "", id_user = "";

  TabController tabController;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString("email");
      username = preferences.getString("username");
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 350.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                ),
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
                Padding(
                  padding: EdgeInsets.only(top: 130),
                  child: Center(
                    child: Text(
                      "$email",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(
                    child: Text(
                      "$username",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 180.0, right: 15.0, left: 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 15.0)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Informasi akun",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10, right: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailUser()));
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  // color: Colors.black,
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blue, blurRadius: 3.0)
                                      ]),
                                  child: Row(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          IconButton(
                                              icon: Icon(
                                                Icons.person,
                                                size: 24,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                              ),
                                              onPressed: () {}),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Detail Profile",
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
