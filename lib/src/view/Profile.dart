import 'dart:convert';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:svdd/src/controller/PerfilController.dart';
import 'package:svdd/src/model/PerfilModel.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var perfil = new List<PerfilModel>();

  _getUsers() {
    APIPerfil.getPerfil().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        perfil = list.map((model) => PerfilModel.fromJson(model)).toList();
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
      title: 'Perfil',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: const Text('Perfil'),
          ),
        ),
        body: ListView.builder(
          itemCount: perfil == null ? 0 : perfil.length,
          itemBuilder: (context, index) {
            return new Column(children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red[600], Colors.red[900]],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          minRadius: 60.0,
                          child: CircleAvatar(
                            radius: 55.0,
                            backgroundImage: NetworkImage(perfil[index].img),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nome',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      perfil[index].nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              /*Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.deepOrange.shade300,
                        child: ListTile(
                          title: Text(
                            'Pegar Localização',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                    child: Container(
                      color: Colors.red,
                      child: ListTile(
                        title: Text(
                          '5000',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          'Following',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),*/
              Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Endereco',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Pagar com',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Cartao credito Final 8033',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Cupons',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Meios de pagamentos',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(),
                    /*ListTile(
                      title: Text(
                        'Data vencimento do plano',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),*/
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ]);
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
            initialActiveIndex: 3,
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
