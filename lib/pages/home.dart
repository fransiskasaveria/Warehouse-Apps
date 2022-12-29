import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.user,
    required this.auth,
  });

  final User user;
  final FirebaseAuth auth;

  void logout() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warehouse Application'),
        backgroundColor: const Color.fromARGB(255, 0, 90, 3),
      ),
      backgroundColor: const Color.fromARGB(255, 225, 231, 221),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                "ADMIN GUDANG",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: Text("pabrik.segah@klk.co.id"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.icon-icons.com/images/no_results2.png"),
              ),
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 90, 3)),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person),
              title: const Text("Profil"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.vpn_key),
              title: const Text("Ubah Password"),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.info),
              title: const Text("Info"),
            ),
            ListTile(
              onTap: () => logout(),
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Keluar"),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                splashColor: const Color.fromARGB(255, 185, 221, 186),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.add_shopping_cart_sharp,
                        color: Color.fromARGB(255, 150, 29, 29),
                        size: 70.0,
                      ),
                      Text("Tambah Barang", style: TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                splashColor: const Color.fromARGB(255, 185, 221, 186),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.warehouse_sharp,
                        color: Color.fromARGB(255, 53, 148, 56),
                        size: 70.0,
                      ),
                      Text("List Barang Stok", style: TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                splashColor: const Color.fromARGB(255, 185, 221, 186),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.qr_code,
                        size: 70.0,
                      ),
                      Text("Scan QR Code", style: TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                splashColor: const Color.fromARGB(255, 185, 221, 186),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.library_books,
                        color: Color.fromARGB(255, 80, 44, 31),
                        size: 70.0,
                      ),
                      Text("Laporan Stok", style: TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
