import 'dart:math';

import 'package:ejemplo/pages/pag2_page.dart';
import 'package:flutter/material.dart';
import 'models/colores.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Titile Material App',
      home: Home(),
      routes: {'pag2': (_) => Pag2()},
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

double randomDoubleInRange({double min = 0.0, double max = 1.0}) {
  return Random().nextDouble() * (max - min + 1) + min;
}

class _HomeState extends State<Home> {
  Color color1 = Colors.amberAccent;
  Color color2 = Colors.redAccent;
  double alto1 = randomDoubleInRange(min: 50, max: 100);
  double alto2 = randomDoubleInRange(min: 50, max: 100);
  double ancho1 = randomDoubleInRange(min: 50, max: 100);
  double ancho2 = randomDoubleInRange(min: 50, max: 100);

  @override
  Widget build(BuildContext context) {
    return ColorsInhe(
      color1: color1,
      color2: color2,
      alto1: alto1,
      alto2: alto2,
      ancho1: ancho1,
      ancho2: ancho2,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DummiContainer(),
              DummiContainer2(),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'pag2');
                  },
                  icon: Icon(Icons.arrow_forward_ios_sharp))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit_outlined),
          onPressed: () {
            setState(() {
              color1 = Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
              color2 = Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);
              alto1 = randomDoubleInRange(min: 50, max: 100);
              alto2 = randomDoubleInRange(min: 50, max: 100);
              ancho1 = randomDoubleInRange(min: 50, max: 100);
              ancho2 = randomDoubleInRange(min: 50, max: 100);
            });
          },
        ),
      ),
    );
  }
}

class DummiContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coloresInhe =
        context.dependOnInheritedWidgetOfExactType<ColorsInhe>();
    return AnimatedContainer(
      height: coloresInhe?.alto1,
      width: coloresInhe?.ancho1,
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: coloresInhe?.color1,
      ),
    );
  }
}

class DummiContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coloresInhe =
        context.dependOnInheritedWidgetOfExactType<ColorsInhe>();
    return AnimatedContainer(
      height: coloresInhe?.alto2,
      width: coloresInhe?.ancho2,
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: coloresInhe?.color2,
      ),
    );
  }
}
