import 'dart:async';

class TagBloc {
  //el controlador del stream
  final tagController = StreamController<String>.broadcast();

  // Recuperar los datos del Stream
  Stream<String> get tagStream => tagController.stream;

  //agregar al stream
  Function(String) get changeTag => tagController.sink.add;

  //cierra el stream
  dispose() {
    tagController.close();
  }

  //
}
