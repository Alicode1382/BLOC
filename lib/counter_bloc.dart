import 'dart:async';

import 'package:blocsample/counter_event.dart';

class Counterbloc {
  int _counter = 0;

  final counterstatecontroller = StreamController<int>();
  StreamSink<int> get _inCounter => counterstatecontroller.sink;
  Stream<int> get counter => counterstatecontroller.stream;

  final _countereventcontroller = StreamController<Counterevents>();

  Sink<Counterevents> get counterEvenetsink => _countereventcontroller.sink;

  Counterbloc() {
    _countereventcontroller.stream.listen(mapeventtostate);
  }

  void mapeventtostate(Counterevents event) {
    if (event is Encrementevent) {
      _counter++;
    } else {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    counterstatecontroller.close();
    _countereventcontroller.close();
  }
}
