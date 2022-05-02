import 'package:cloud_firestore/cloud_firestore.dart';

Future<dynamic> getCapitanes() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Capitanes");
  QuerySnapshot capitanes = await collectionReference.get();
  capitanesLista = [];
  if (capitanes.docs.isNotEmpty) {
    for (var item in capitanes.docs) {
      capitanesLista
          .add(Capitanes(item["id"], item["Equipo_id"], item["Nombre"]));
    }
  }
  return capitanesLista;
}

Future<dynamic> getEquipos() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Equipo");
  QuerySnapshot equipos = await collectionReference.get();
  equiposLista = [];
  if (equipos.docs.isNotEmpty) {
    for (var item in equipos.docs) {
      equiposLista.add(Equipos(item["id"], item["Nombre"], item["Entrenador"],
          item["estaEnPrimera"], item["web"]));
    }
  }
  return equiposLista;
}

Future<dynamic> getEstadio() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Estadio");
  QuerySnapshot estadios = await collectionReference.get();
  estadioLista = [];
  if (estadios.docs.isNotEmpty) {
    for (var item in estadios.docs) {
      estadioLista.add(Estadio(item["id"], item["Nombre"], item["Capacidad"]));
    }
  }
  return estadioLista;
}

getCoordenas() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Coordenadas");
  QuerySnapshot coordenadas = await collectionReference.get();
  coordenadasLista = [];
  if (coordenadas.docs.isNotEmpty) {
    for (var item in coordenadas.docs) {
      coordenadasLista.add(
          Coordenadas(item["Estadio_id"], item["latitud"], item["longitud"]));
    }
  }
}

List<Capitanes> capitanesLista = [];
List<Equipos> equiposLista = [];
List<Estadio> estadioLista = [];
List<Coordenadas> coordenadasLista = [];

class Equipos {
  final int id;
  final String nombre;
  final String entrenador;
  final bool estaEnPrimera;
  final String web;

  Equipos(this.id, this.nombre, this.entrenador, this.estaEnPrimera, this.web);
}

class Capitanes {
  final int id;
  final int idEquipo;
  final String nomnbre;

  Capitanes(this.id, this.idEquipo, this.nomnbre);
}

class Estadio {
  final num id;
  final String nombre;
  final num capacidad;

  Estadio(this.id, this.nombre, this.capacidad);
}

class Coordenadas {
  final int idEstadio;
  final String latitud;
  final String longitud;

  Coordenadas(this.idEstadio, this.latitud, this.longitud);
}
