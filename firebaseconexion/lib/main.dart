import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconexion/conexion.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding();
  Firebase.initializeApp().then(
    (value) {
      runApp(const Home());
    },
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      home: Principal(),
    );
  }
}

class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  _cargarDatos() {
    setState(() {
      getEquipos();
      getCapitanes();
      getCoordenas();
      getEstadio();
    });
    return getEquipos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase - Flutter"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [listadoDatos()],
          ),
        ),
      ),
    );
  }

  Widget listadoDatos() {
    return FutureBuilder(
      future: _cargarDatos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: List.generate(equiposLista.length, (index) {
              return Center(
                  child: SizedBox(
                width: 400,
                child: Column(children: [
                  Card(
                    elevation: 8,
                    shadowColor: const Color.fromARGB(255, 176, 39, 39),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 231, 92, 92), width: 1)),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 25, bottom: 25),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Text(
                                equiposLista[index].nombre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  const SizedBox(
                                      width: 75, child: Text("Entrenador:")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(equiposLista[index].entrenador)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  const SizedBox(
                                      width: 75, child: Text("Capitan:")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(capitanesLista[index].nomnbre)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  const SizedBox(
                                      width: 75, child: Text("Estadio:")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(estadioLista[index].nombre)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  const SizedBox(
                                      width: 75, child: Text("Capacidad:")),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(estadioLista[index].capacidad.toString())
                                ],
                              ),
                            )
                          ],
                        )),
                  )
                ]),
              ));
            }),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
