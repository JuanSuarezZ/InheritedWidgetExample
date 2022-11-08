import 'dart:async';

import 'package:flutter/material.dart';

import '../bloc/bloc.dart';

class StreamsPage extends StatefulWidget {
  @override
  State<StreamsPage> createState() => _StreamsPageState();
}

class _StreamsPageState extends State<StreamsPage> {
  final StreamController<String> controller = TagBloc().tagController;
  late final StreamSubscription<String> streamSubscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  final stream = controller.stream;
                  streamSubscription = stream.listen((event) {
                    print("valor: agregado: $event");
                  });
                },
                child: const Text('subscription')),
            ElevatedButton(
                onPressed: () {
                  controller.sink.add("evento");
                },
                child: const Text('push')),
            ElevatedButton(
                onPressed: () {
                  streamSubscription.cancel();
                },
                child: const Text('Unbscription')),
          ],
        ),
      ),
    );
  }
}
