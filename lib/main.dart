import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:kost/Admin/Home.dart';
import 'package:kost/Admin/Produk.dart';
import 'package:kost/Admin/Profile.dart';
import 'package:kost/Admin/Tampilan.dart';
import 'package:kost/Modal/Api.dart';
import 'package:kost/User/aboutuser.dart';
import 'package:kost/User/homeuser.dart';
import 'package:kost/User/profileuser.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSigin, sigIn, signIuser }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSigin;
  final _formKey = new GlobalKey<FormState>();
  String email, password;

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  var _autovalidate = true;
  check() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      login();
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  login() async {
    final response = await http.post(BaseUrl.login, body: {
      "email": email,
      "password": password,
    });
    // print(response.body);
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String usernameAPI = data['email'];
    String level = data['level'];
    String id_user = data['id_user'];
    String username = data['username'];
    String hp = data['hp'];
    String datecreate = data['datecreate'];
    if (value == 1) {
      if (level == "1") {
        setState(() {
          _loginStatus = LoginStatus.sigIn;
          savePref(
              value, usernameAPI, level, id_user, username, hp, datecreate);
        });
      } else if (level == "2") {
        setState(() {
          _loginStatus = LoginStatus.signIuser;
          savePref(value, email, level, id_user, username, hp, datecreate);
        });
      }
      print(pesan);
    } else {
      print(pesan);
    }
  }

  savePref(
    int value,
    String email,
    String level,
    String id_user,
    String username,
    String hp,
    String datecreate,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("email", email);
      preferences.setString("level", level);
      preferences.setString("id_user", id_user);
      preferences.setString("username", username);
      preferences.setString("hp", hp);
      preferences.setString("datecreate", datecreate);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getString("level");

      _loginStatus = value == "1"
          ? LoginStatus.sigIn
          : value == "2" ? LoginStatus.signIuser : LoginStatus.notSigin;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.setString("level", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSigin;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSigin:
        return Scaffold(
          body: Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage("assets/gambar6.jpg"),
            //   fit: BoxFit.cover,
            // )),
            child: ListView(
              padding: const EdgeInsets.only(
                top: 100.0,
                right: 20.0,
                left: 20.0,
                bottom: 20.0,
              ),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Pencarian Kost Palembang',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico"),
                      ),
                      SizedBox(
                        height: 75.0,
                      ),
                      TextFormField(
                        onSaved: (e) => email = e,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Insert email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          icon: Icon(Icons.people, color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: _secureText,
                        onSaved: (e) => password = e,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Insert password!!!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white30,
                          filled: true,
                          hintText: 'password',
                          suffixIcon: IconButton(
                            onPressed: showHide,
                            icon: Icon(_secureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          icon: Icon(
                            Icons.lock,
                            color: Colors.blueAccent,
                          ),
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
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
                              check();
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Register()));
                        },
                        child: Text("create an new account",
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case LoginStatus.sigIn:
        return MainMenu(signOut);
        break;
      case LoginStatus.signIuser:
        return MainUser(signOut);
        break;
    }
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email, password, username, hp;
  final _formKey = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    final response = await http.post(BaseUrl.registrasi, body: {
      "username": username,
      "email": email,
      "password": password,
      "hp": hp,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //   image: AssetImage("assets/gambar6.jpg"),
          //   fit: BoxFit.cover,
          // )),
          child: ListView(
            padding: const EdgeInsets.only(
              top: 100.0,
              right: 20.0,
              left: 20.0,
              bottom: 20.0,
            ),
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico"),
                    ),
                    SizedBox(
                      height: 75.0,
                    ),
                    TextFormField(
                      onSaved: (e) => email = e,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Insert email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        icon: Icon(Icons.email, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: _secureText,
                      onSaved: (e) => password = e,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Insert password!!!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'password',
                        suffixIcon: IconButton(
                          onPressed: showHide,
                          icon: Icon(_secureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.blueAccent,
                        ),
                        labelText: 'password',
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      onSaved: (e) => hp = e,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Insert your number phone';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'HP',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        icon: Icon(Icons.call, color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onSaved: (e) => username = e,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Insert username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: 'Username',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        icon: Icon(Icons.supervised_user_circle,
                            color: Colors.blueAccent),
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
                            check();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Login()));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text("sudah punya account",
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainMenu extends StatefulWidget {
  final VoidCallback signOut;
  MainMenu(this.signOut);
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "$username",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                signOut();
              },
              icon: Icon(Icons.lock_open),
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Home(),
            Produk(),
            Tampilan(),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.person_add),
              text: "Produk",
            ),
            Tab(
              icon: Icon(Icons.supervised_user_circle),
              text: "User",
            ),
          ],
        ),
      ),
    );
  }
}

class MainUser extends StatefulWidget {
  final VoidCallback signOut;
  MainUser(this.signOut);
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            HomeUser(),
            ProfileUser(),
            AboutUser(signOut),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "profile",
            ),
            Tab(
              icon: Icon(Icons.info),
              text: "about",
            ),
          ],
        ),
      ),
    );
  }
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   File _image;
//   Future getImageGallery() async {
//     var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = imageFile;
//     });
//   }

//   Future getImageCamera() async {
//     var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
//     setState(() {
//       _image = imageFile;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Center(
//             child: _image == null
//                 ? new Text("tidak ada gambar")
//                 : new Image.file(_image),
//           ),
//           RaisedButton(
//             onPressed: getImageGallery,
//             child: Icon(Icons.image),
//           ),
//           RaisedButton(
//             onPressed: getImageCamera,
//             child: Icon(Icons.camera),
//           )
//         ],
//       ),
//     );
//   }
// }
