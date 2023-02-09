import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modernlogintute/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.orange),
      home: MyApp(),
    ));

class DashboardUser extends StatefulWidget {
  @override
  State<DashboardUser> createState() => _DashboardUser();
}

class _DashboardUser extends State<DashboardUser> {
  late String alumniNama, alumniID, alumniJurusan, alumniTempat_kerja;

  getAlumniNama(nama) {
    this.alumniNama = nama;
  }

  getAlumniID(id) {
    this.alumniID = id;
  }

  getAlumniJurusan(jurusan) {
    this.alumniJurusan = jurusan;
  }

  getAlumniTempat_kerja(tempat_kerja) {
    this.alumniTempat_kerja = tempat_kerja;
  }

  createData() {
    print("created");

    // DocumentReference documentReference =
    //     Firestore.instance.collection("Alumni").document(alumniNama);
    //     CollectionReference users =

    // Map<String, dynamic> alumni = {
    //   "alumniNama": alumniNama,
    //   "alumniID": alumniID,
    //   "alumniJurusan": alumniJurusan,
    //   "alumniTempat_kerja": alumniTempat_kerja
    // };

    // documentReference.set(alumni).whenComplete( () {
    //   print("$alumniNama created")
    // });
  }

  readData() {
    print("read");
  }

  updateData() {
    print("updated");
  }

  deleteData() {
    print("deleted");
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference alumni = firebaseFirestore.collection('Alumni');
    // final alumniNama = TextEditingController();
    final TextEditingController alumniNama = TextEditingController();
    final TextEditingController alumniID = TextEditingController();
    final TextEditingController alumniJurusan = TextEditingController();
    final TextEditingController alumniTempat_kerja = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard User"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: alumniNama,
                  decoration: InputDecoration(
                      labelText: "Nama",
                      fillColor: Colors.orange,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0))),
                  onChanged: (String nama) {
                    getAlumniNama(nama);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: alumniID,
                  decoration: InputDecoration(
                      labelText: "ID Alumni",
                      fillColor: Colors.orange,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0))),
                  onChanged: (String id) {
                    getAlumniID(id);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: alumniJurusan,
                  decoration: InputDecoration(
                      labelText: "Jurusan",
                      fillColor: Colors.orange,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0))),
                  onChanged: (String jurusan) {
                    getAlumniJurusan(jurusan);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  controller: alumniTempat_kerja,
                  decoration: InputDecoration(
                      labelText: "Tempat Kerja",
                      fillColor: Colors.orange,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0))),
                  onChanged: (String tempat_kerja) {
                    getAlumniTempat_kerja(tempat_kerja);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      alumni.add({
                        'alumniNama': alumniNama.text,
                        'alumniID': alumniID.text,
                        'alumniJurusan': alumniJurusan.text,
                        'alumniTempat_kerja': alumniTempat_kerja.text,
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      "Read",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      readData();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      updateData();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      deleteData();
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: Text("Logout"))
                ],
              ),
            ],
          )),
    );
  }
}

        //   margin: EdgeInsets.all(10),
        //   child: Column(
        //     children: [
        //       Text("alumni"),
        //       ElevatedButton(
        //           onPressed: () {
        //             FirebaseAuth.instance.signOut();
        //           },
        //           child: Text("Logout"))
        //     ],
        //   ),
        // ),
       
 