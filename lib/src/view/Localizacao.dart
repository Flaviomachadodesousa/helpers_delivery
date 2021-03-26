import 'dart:async';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Localizacao extends StatefulWidget {
  @override
  _LocalizacaoState createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {
  @override
  //ligacao db firestore
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Completer<GoogleMapController> _controller = Completer();
  // inicia o mapa normal
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-27.1264815, -109.2785275),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'localizacao',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Localização')),
          backgroundColor: Colors.blue[700],
        ),
        //iniciado o googlemaps
        body: GoogleMap(
          mapType: _currentMapType,
          //coletando os markers do firestore
          markers: Set<Marker>.of(markers.values),
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _onMapTypeButtonPressed,
          label: Text('Alterar'),
          icon: Icon(Icons.map),
        ),
        bottomNavigationBar: ConvexAppBar(
            style: TabStyle.react,
            items: [
              TabItem(title: 'Restaurantes', icon: Icons.restaurant),
              TabItem(title: 'Mercados', icon: Icons.room_service),
              TabItem(title: 'Localizacao', icon: Icons.map),
              TabItem(title: 'Perfil', icon: Icons.person),
            ],
            initialActiveIndex: 2,
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

  //corregando os markers
  loadmap() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('markers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Carregando');
        for (int i = 0; i < snapshot.data.documents.length; i++) {
          markers;
        }
      },
    );
  }

  //funcao alterar satelite ou mapa normal.
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
}
