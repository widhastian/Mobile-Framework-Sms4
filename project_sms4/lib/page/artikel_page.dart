import 'dart:convert';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:http/http.dart' as http;

import 'get_detail_artikel.dart';

// import 'detail_artikel_page.dart';

class Artikel extends StatefulWidget {
  const Artikel({Key? key}) : super(key: key);

  @override
  _ArtikelState createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  //pencarian
  TextEditingController textController = new TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF6AA83F),
        automaticallyImplyLeading: false,
        title: Text(
          'Artikel',
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: textController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'textController',
                      Duration(milliseconds: 2000),
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
                                size: 20,
                              ),
                            )
                          : null,
                    ),
                    style: GoogleFonts.getFont(
                      'Poppins',
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                getDataArtikel()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class getDataArtikel extends StatefulWidget {
  const getDataArtikel({Key? key}) : super(key: key);

  @override
  _getDataArtikelState createState() => _getDataArtikelState();
}

class _getDataArtikelState extends State<getDataArtikel> {
  //get data artikel
  final String url = "https://ws-tif.com/gofarm/public/api/artikel";
  List? data;

  @override
  void initState() {
    _getRefreshData();
    super.initState();
  }

  Future<void> _getRefreshData() async {
    this.getJsonData(context);
  }

  Future<void> getJsonData(BuildContext context) async {
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
    });
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _getRefreshData,
      child: data == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data == null ? 0 : data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetDataDetailArtikel(
                                    value: data![index]["id"])),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    // ExtendedImage.network(
                                    //   data![index]["foto"],
                                    //   width: 450,
                                    //   height: 150,
                                    //   fit: BoxFit.cover,
                                    //   // cache: true,
                                    // ),
                                    // Image.asset(
                                    //   'assets/images/pupuk_padi.jpg',
                                    //   width: 450,
                                    //   height: 150,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    Image.network(
                                      data![index]["foto"],
                                      width: 450,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      width: 450,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                        child: Text(
                                          data![index]["judul"],
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Divider()
                    ],
                  ),
                );
              }),
    );
  }
}
