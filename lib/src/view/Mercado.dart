import 'dart:convert';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:svdd/src/controller/ClienteController.dart';
import 'package:svdd/src/model/ClienteModel.dart';

class Mercado extends StatefulWidget {
  @override
  _MercadoState createState() => _MercadoState();
}

class _MercadoState extends State<Mercado> {
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
      title: 'Mercado',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Mercado'),
          ),
        ),
        body: ListView.builder(
            controller: _getUsers(),
            itemCount: restaurante == null ? 0 : restaurante.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8,
                child: InkWell(
                  onTap: () async {
                    print(restaurante[index].nome);
                  },
                  child: Container(
                    height: 120.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(2),
                                  topLeft: Radius.circular(2)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/responsive.png'))),
                        ),
                        Container(
                          height: 120,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  restaurante[index].nome,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 15, 0, 3),
                                  child: Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.teal),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Text(
                                      restaurante[index].nome,
                                      /*catalogo[index].titulo,*/
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                /*Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                              child: Container(
                                width: 230,
                                child: Text(
                                  "Data estreia: " + catalogo[index].titulo,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 48, 48, 54)),
                                ),
                              ),
                            )*/
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
        bottomNavigationBar: ConvexAppBar(
            style: TabStyle.react,
            items: [
              TabItem(title: 'Restaurantes', icon: Icons.restaurant),
              TabItem(title: 'Mercados', icon: Icons.room_service),
              TabItem(title: 'Localizacao', icon: Icons.map),
              TabItem(title: 'Perfil', icon: Icons.person),
            ],
            initialActiveIndex: 1,
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
