import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/dashboard/admin_dashboard.dart';
import 'package:modernlogintute/dashboard/user_dashboard.dart';
import 'package:modernlogintute/pages/login_page.dart';
import 'home_page.dart';
import 'login_register_page.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  CollectionReference users = FirebaseFirestore.instance.collection("akun");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            User currentUser = FirebaseAuth.instance.currentUser!;
            Future<String> userRole =
                users.doc(currentUser.uid).get().then((value) {
              final data = value.data() as Map<String, dynamic>;
              return data["role"];
            });

            return FutureBuilder(
              future: userRole,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot);
                  if (snapshot.data == "Admin") {
                    return HomePage();
                  } else {
                    return DashboardUser();
                  }
                } else {
                  return DashboardScreen();
                }
              },
            );
          }

          // user is NOT logged in
          else {
            return LoginOrRegisterPage();
            // return CircularProgressIndicator();
            // return Center(
            //   child: Text("login"),
            // );
          }
        },
      ),
    );
  }
}
