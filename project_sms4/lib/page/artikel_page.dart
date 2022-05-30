import 'package:flutter/material.dart';

class Artikel extends StatefulWidget {
  // const Dashboard({ Key? key }) : super(key: key);

  @override
  _ArtikelState createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Artikel')),
      body: Center(
        child: Text('Artikel Screen', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
