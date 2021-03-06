import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:project_sms4/navigationBottom.dart';
import 'package:project_sms4/page/login_page.dart';
import 'package:project_sms4/page/opening.dart';
import 'package:project_sms4/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  late bool _passwordVisible;
  var kategori;
  var password;
  var name;
  var phone;

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
                Align(
                  // alignment: AlignmentDirectional(-0.35, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: Text(
                      'Selamat Datang di GoFarm!',
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
                      hintText: "contoh: widha astianna",
                      hintStyle: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                      labelText: "Nama Lengkap",
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
                        Icons.person,
                        color: fromCssColor('#6AA83F'),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'nama tidak boleh kosong';
                      }
                      return null;
                    },
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
                      labelText: "Konfirmasi Password",
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 230, 0, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      this._register();
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
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
                    child: Text("Daftar"),
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
                          'Sudah punya akun?',
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
                            'Masuk disini!',
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
                                    builder: (context) => Login()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'password': password,
      'kategori': kategori,
      'phone': phone,
      'name': name
    };

    var res = await Network().authData(data, '/register');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => navBottom()),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
