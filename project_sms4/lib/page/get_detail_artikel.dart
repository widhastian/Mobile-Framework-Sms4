import 'dart:convert';
import 'dart:html';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'artikel_page.dart';

class GetDataDetailArtikel extends StatefulWidget {
  int? value;
  GetDataDetailArtikel({Key? key, value}) : super(key: key);

  @override
  State<GetDataDetailArtikel> createState() =>
      _GetDataDetailArtikelState(value);
}

class _GetDataDetailArtikelState extends State<GetDataDetailArtikel> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int? value;
  _GetDataDetailArtikelState(this.value);
  Map? data;
  String? uri;

  @override
  void initState() {
    // TODO: implement initState
    var url =
        "https://ws-tif.com/gofarm/public/api/artikel/${value.toString()}";

    _getRefreshData(url);

    print("message + ${value}");
  }

  Future<void> _getRefreshData(url) async {
    getJsonData(context, url);
  }

  Future<void> getJsonData(BuildContext context, url) async {
    setState(() {
      uri = url;
    });

    var response = await http.get(Uri.parse(uri.toString()),
        headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF6AA83F),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        title: Text(
          'Detail Artikel',
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
        elevation: 2,
      ),
      body: Container(
          child: data == null
              ? Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Loading . . .",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )))
              : getDetail()),
    );
  }
}

class getDetail extends StatefulWidget {
  int? value;

  getDetail({Key? key, value}) : super(key: key);

  @override
  State<getDetail> createState() => _getDetailState(value);
}

class _getDetailState extends State<getDetail> {
  int? value;
  _getDetailState(this.value);
  Map? data;
  String? uri;

  @override
  void initState() {
    // TODO: implement initState
    var url =
        "https://ws-tif.com/gofarm/public/api/artikel/${value.toString()}";

    _getRefreshData(url);

    print("artikel + ${value}");
  }

  Future<void> _getRefreshData(url) async {
    getJsonData(context, url);
  }

  Future<void> getJsonData(BuildContext context, url) async {
    setState(() {
      uri = url;
    });

    var response = await http.get(Uri.parse(uri.toString()),
        headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  data!["judul"],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Poppins',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        data!["created_at"],
                        textAlign: TextAlign.start,
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Text(
                          '|',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        data!["updated_at"],
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ExtendedImage.network(
                      data!["foto"],
                      width: 450,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    data!["deskripsi"],
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.getFont(
                      'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
