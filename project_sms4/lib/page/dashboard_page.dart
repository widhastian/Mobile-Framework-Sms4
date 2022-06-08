import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_sms4/themes.dart';

class Dashboard extends StatefulWidget {
  // const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.displayLarge,
                        children: [
                      TextSpan(
                        text: "Hii Widha\n",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text: "Selamat datang di GoFarm",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      )
                    ]))),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 175,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 255, 193),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 33,
                          color: kShadowColor,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      left: 200,
                      child: Stack(
                        children: <Widget>[
                          Image.asset("images/petani.png")
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.displayLarge,
                              children: [
                            TextSpan(
                              text: "GoFarm \n",
                              style: GoogleFonts.getFont(
                                'Poppins',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "Akan membantu anda dalam\n menangani permasalahan\n pertanian",
                              style: GoogleFonts.getFont(
                                'Poppins',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                              ),
                            )
                          ]))),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.displayLarge,
                        children: [
                      TextSpan(
                        text: "Konsultasi \n",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Anda dapat melakukan konsultasi\n dengan para pakar",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                      )
                    ]))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Card(
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(60 / 2),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/popt1.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                          child: RichText(
                              text: TextSpan(
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  children: [
                                TextSpan(
                                  text: "Rury Endang \n",
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: "Semboro",
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                  ),
                                )
                              ]))),
                      IconButton(
                        padding: EdgeInsetsDirectional.fromSTEB(260, 0, 0, 0),
                        icon: new Icon(
                          Icons.chat_sharp,
                        ),
                        onPressed: () {},
                        color: Color(0xFF6AA83F),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Card(
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(60 / 2),
                          image: DecorationImage(
                            image: AssetImage(
                              "images/popt2.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                          child: RichText(
                              text: TextSpan(
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                  children: [
                                TextSpan(
                                  text: "Eko Prasetyo \n",
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sidomekar",
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                  ),
                                )
                              ]))),
                      IconButton(
                        padding: EdgeInsetsDirectional.fromSTEB(260, 0, 0, 0),
                        icon: new Icon(
                          Icons.chat_sharp,
                        ),
                        onPressed: () {},
                        color: Color(0xFF6AA83F),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
