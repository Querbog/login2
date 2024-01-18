import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: Container(
        child: ListView(children: [
          DrawerHeader(
            child: Text(
              "User Name",
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Wanna Chat?'),
          )
        ]),
      )),
    );
  }
}
