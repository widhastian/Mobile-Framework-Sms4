import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Login.dart';
import 'Register.dart';
import 'package:from_css_color/from_css_color.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Image.asset(
                        'assets/images/image 3.png',
                        width: 350,
                        height: double.infinity,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Selamat Datang di CFarmer!',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        'Pusat konsultasi dan bantuan seputar\npermasalahan pertanian anda',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 80),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 2, 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: fromCssColor('#6AA83F'),
                          onPrimary: Colors.white,
                          minimumSize: Size(165, 50),
                          side: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          textStyle: GoogleFonts.getFont(
                            'Poppins',
                            // color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                          ),
                          elevation: 3,
                        ),
                        child: Text("Masuk"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 2, 0, 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: fromCssColor('#6AA83F'),
                          minimumSize: Size(165, 50),
                          side: BorderSide(
                            color: fromCssColor('#6AA83F'),
                            width: 1,
                          ),
                          textStyle: GoogleFonts.getFont(
                            'Poppins',
                            // color: fromCssColor('#6AA83F'),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                          ),
                          elevation: 3,
                        ),
                        child: Text("Daftar"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
