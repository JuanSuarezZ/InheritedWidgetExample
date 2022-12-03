import 'dart:math';

import 'package:ejemplo/pages/ingerited_widget.dart';
import 'package:ejemplo/pages/pag2_page.dart';
import 'package:ejemplo/pages/streams_page.dart';
import 'package:flutter/material.dart';
import 'models/colores.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Titile2 Material App',
      initialRoute: 'ingerited_widget',
      routes: {
        'pag2': (_) => const Pag2(),
        'streams': (_) => StreamsPage(),
        'ingerited_widget': (_) => const IngeritehWidgetExample()
      },
    );
  }
}
