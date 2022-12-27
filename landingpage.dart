import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        appBar: AppBar(
          title: Text('Warehouse Application'),
          backgroundColor: Color.fromARGB(255, 0, 90, 3),
        ),
        backgroundColor: Color.fromARGB(255, 225, 231, 221),
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: new Text(
                  "ADMIN GUDANG",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                accountEmail: new Text("pabrik.segah@klk.co.id"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://icon-icons.com/id/icon/akun-lingkaran/89831"),
                ),
                decoration:
                    new BoxDecoration(color: Color.fromARGB(255, 0, 90, 3)),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profil"),
              ),
              ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text("Ubah Password"),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("Info"),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Keluar"),
              )
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.count(crossAxisCount: 2, children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Color.fromARGB(255, 185, 221, 186),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.add_shopping_cart_sharp,
                        color: Color.fromARGB(255, 150, 29, 29),
                        size: 70.0,
                      ),
                      Text("Tambah Barang",
                          style: new TextStyle(fontSize: 17.0))
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Color.fromARGB(255, 185, 221, 186),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.warehouse_sharp,
                        color: Color.fromARGB(255, 53, 148, 56),
                        size: 70.0,
                      ),
                      Text("List Barang Stok",
                          style: new TextStyle(fontSize: 17.0))
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Color.fromARGB(255, 185, 221, 186),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.qr_code,
                        size: 70.0,
                      ),
                      Text("Scan QR Code", style: new TextStyle(fontSize: 17.0))
                    ],
                  ))),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Color.fromARGB(255, 185, 221, 186),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.library_books,
                        color: Color.fromARGB(255, 80, 44, 31),
                        size: 70.0,
                      ),
                      Text("Laporan Stok", style: new TextStyle(fontSize: 17.0))
                    ],
                  ))),
            ),
          ]),
        ));
  }
}
