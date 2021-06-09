import 'package:flutter/material.dart';

class ColorsInhe extends InheritedWidget {
  final Color color1;
  final Color color2;
  final double alto1;
  final double alto2;
  final double ancho1;
  final double ancho2;

  const ColorsInhe({
    Key? key,
    required Widget child,
    required this.color1,
    required this.color2,
    required this.alto1,
    required this.alto2,
    required this.ancho1,
    required this.ancho2,
  }) : super(key: key, child: child);

  static ColorsInhe? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorsInhe>();
  }

  @override
  bool updateShouldNotify(ColorsInhe oldWidget) {
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
  }
}
