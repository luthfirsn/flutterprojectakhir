import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 450,
      color: Color.fromARGB(255, 245, 244, 242),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text(
              'Dashboard',
              style: TextStyle(
                  fontSize: 18,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.black),
            ),
            Spacer(),
            Container(width: 180, height: 40, child: SearchField()),
            ProfilCard()
          ],
        ),
      ),
    );
  }
}

class ProfilCard extends StatelessWidget {
  const ProfilCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2),
      padding: EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        // border:
        //     Border.all(color: Color.fromARGB(255, 4, 58, 236)),
      ),
      child: Row(
        children: [
          Image.asset("images/Logo_Gajah_Tunggal.png", height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              "Gajah Tunggal",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.blue,
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            )),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            padding: EdgeInsets.all(0.75),
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
