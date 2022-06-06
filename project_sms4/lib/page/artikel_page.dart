import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'detail_artikel_page.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  _ArtikelState createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  TextEditingController textController = new TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[Container(decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0), //kiri atas kanan bawah
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Text(
                    'Artikel',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
              ),
            ),
            // PENCARIAN
            Align(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 15),
                      child: TextFormField(
                        controller: textController,
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController',
                          Duration(milliseconds: 1000),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Cari',
                          hintText: 'Cari artikel disini',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF6AA83F),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF6AA83F),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Color(0xFF6AA83F),
                            size: 20,
                          ),
                          suffixIcon: textController.text.isNotEmpty
                              ? InkWell(
                                  onTap: () => setState(
                                    () => textController.clear(),
                                  ),
                                  child: Icon(
                                    Icons.clear,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: 270, //ukuran cardnya
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200, //ukuran gambarnya
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF6AA83F)),
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/artikel1.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                      height: 50,
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // Color(0xFF6AA83F)
                      ),
                      child: Text(
                        "Cara Budidaya Tanaman Bawang Merah yang Baik dan Benar",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),  
                    ),
                  ]
                ),
              ),
            ),
            Card(
              child: Container( 
                height: 270, //ukuran cardnya
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200, //ukuran gambarnya
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF6AA83F)),
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/artikel2.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                      height: 50,
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        "Pengendalian Hama Ulat Pada Tanaman Bawang Merah",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),  
                    ),
                  ]
                ),
              ),
            ),
            Card(
              child: Container( 
                height: 270, //ukuran cardnya
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200, //ukuran gambarnya
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF6AA83F)),
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "images/artikel3.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                      height: 50,
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        "Jenis Tanah yang Cocok Untuk Menanam Bawang Merah",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),  
                    ),
                  ]
                ),
              ),
            ),
          ]
        ),
      ),],
    ),
    );
  }
}
