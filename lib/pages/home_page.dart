import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/list_jurusan.dart';
import 'package:modernlogintute/dashboard/admin_dashboard.dart';
import 'package:modernlogintute/responsive.dart';

import '../dashboard/user_dashboard.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  GlobalKey<ScaffoldState> _scaffoldKEy = GlobalKey<ScaffoldState>();

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKEy,
        drawer: SideMenu(context),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (Responsive.isDesktop(context))
              Expanded(child: DashboardScreen()),
              IconButton(
                icon:
                    Icon(Icons.menu, color: Color.fromARGB(255, 15, 106, 243)),
                onPressed: () => _scaffoldKEy.currentState?.openDrawer(),
              ),
            ],
          ),
        ));
  }

  Drawer SideMenu(BuildContext context) {
    return Drawer(
      // backgroundColor: Color.fromARGB(255, 248, 172, 59),
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text("Account"),
                  accountEmail: Text(user.email!),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/user.png"),
                  ),
                  decoration: new BoxDecoration(color: Colors.blue)),
              DrawerListTile(
                title: "Dashboard",
                assetsSrc: "images/dashboard.png",
                press: () {},
              ),
              DrawerListTile(
                title: "Alumni",
                assetsSrc: "images/education.png",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JurusanDetails()),
                  );
                },
              ),
              DrawerListTile(
                title: "About",
                assetsSrc: "images/info.png",
                press: () {},
              ),
              DrawerListTile(
                title: "Log Out",
                assetsSrc: "images/logout.png",
                press: () {
                  signUserOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.assetsSrc,
    required this.press,
  }) : super(key: key);

  final String title, assetsSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        assetsSrc,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}
