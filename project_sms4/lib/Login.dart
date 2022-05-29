import 'package:project_sms4/page/profile_page.dart';

import 'Home.dart';
import 'Register.dart';
import 'SpashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool _passwordVisible;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      iconSize: 25,
                      color: Colors.black,
                      splashColor: fromCssColor('#6AA83F'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashScreenWidget()));
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.35, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      'Selamat Data Kembali di CFarmer!',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "contoh: widha@gmail.com",
                      hintStyle: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                      labelText: "Alamat Email",
                      labelStyle: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: fromCssColor('#6AA83F'),
                          width: 1,
                        ),
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: fromCssColor('#6AA83F'),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.email,
                        color: fromCssColor('#6AA83F'),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Alamat Email tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: !_passwordVisible,
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: fromCssColor('#6AA83F'),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      hintText: "Masukkan password anda",
                      hintStyle: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                      labelText: "Password",
                      labelStyle: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: fromCssColor('#6AA83F'),
                          width: 1,
                        ),
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: fromCssColor('#6AA83F'),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: fromCssColor('#6AA83F'),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      'Lupa kata sandi?',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.getFont(
                        'Poppins',
                        color: fromCssColor('#6AA83F'),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 230, 0, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: fromCssColor('#6AA83F'),
                      onPrimary: Colors.white,
                      minimumSize: Size(450, 60),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                        child: Text(
                          'Belum punya akun?',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                        child: TextButton(
                          child: Text(
                            'Daftar disini!',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: fromCssColor('#6AA83F'),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
                  child: Text(
                    'OR',
                    style: GoogleFonts.getFont(
                      'Poppins',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset('icons/icon_google.png'),
                    label: Text("Sign In with Google"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(450, 60),
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
