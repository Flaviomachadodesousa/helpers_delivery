import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:svdd/src/controller/ClienteController.dart';
import 'package:svdd/src/model/ClienteModel.dart';

class HomeIndex extends StatefulWidget {
  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  var restaurante = new List<ClienteModel>();
  _getUsers() {
    API.getRestaurantes().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        restaurante =
            list.map((model) => ClienteModel.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'index',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Restaurantes'),
          ),
        ),
        body: ListView.builder(
          controller: _getUsers(),
          itemCount: restaurante == null ? 0 : restaurante.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              margin:
                  EdgeInsets.only(left: 5.0, right: 5.0, top: 12, bottom: 2),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () async {},
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(restaurante[index].img),
                      ),
                      title: Text(restaurante[index].nome),
                      subtitle: Text(
                        restaurante[index].endereco,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Text(
                      'Frete 6,00',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      textAlign: TextAlign.start,
                    ),
                    Text('')
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: ConvexAppBar(
            style: TabStyle.react,
            items: [
              TabItem(title: 'Restaurantes', icon: Icons.restaurant),
              TabItem(title: 'Mercados', icon: Icons.room_service),
              TabItem(title: 'Localizacao', icon: Icons.map),
              TabItem(title: 'Perfil', icon: Icons.person),
            ],
            initialActiveIndex: 0,
            onTap: (int i) {
              if (i == 0) {
                //Navigator.pop(context);
                Navigator.of(context).pushNamed('/index');
              }
              if (i == 1) {
                //Navigator.pop(context);
                Navigator.of(context).pushNamed('/mercado');
              }
              if (i == 2) {
                //Navigator.pop(context);
                Navigator.of(context).pushNamed('/localizacao');
              }
              if (i == 3) {
                //Navigator.pop(context);
                Navigator.of(context).pushNamed('/profile');
              }
              print('click index=$i');
            }),
      ),
    );
  }
}
