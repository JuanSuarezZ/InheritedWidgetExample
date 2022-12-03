import 'dart:math';

import 'package:ejemplo/models/colores.dart';
import 'package:flutter/material.dart';

class IngeritehWidgetExample extends StatefulWidget {
  const IngeritehWidgetExample({Key? key}) : super(key: key);

  @override
  _IngeritehWidgetExampleState createState() => _IngeritehWidgetExampleState();
}

double randomDoubleInRange({double min = 0.0, double max = 1.0}) {
  return Random().nextDouble() * (max - min + 1) + min;
}

class _IngeritehWidgetExampleState extends State<IngeritehWidgetExample> {
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
            children: const [
              DummiContainer(),
              DummiContainer2()
              // IconButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, 'pag2');
              //     },
              //     icon: const Icon(Icons.arrow_forward_ios_sharp))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.ac_unit_outlined),
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
  const DummiContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coloresInhe =
        context.dependOnInheritedWidgetOfExactType<ColorsInhe>();
    return AnimatedContainer(
      height: coloresInhe?.alto1,
      width: coloresInhe?.ancho1,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: coloresInhe?.color1,
      ),
    );
  }
}

class DummiContainer2 extends StatelessWidget {
  const DummiContainer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coloresInhe =
        context.dependOnInheritedWidgetOfExactType<ColorsInhe>();
    return AnimatedContainer(
      height: coloresInhe?.alto2,
      width: coloresInhe?.ancho2,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: coloresInhe?.color2,
      ),
    );
  }
}
