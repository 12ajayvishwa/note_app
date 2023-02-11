import 'dart:async';

import 'package:flutter/cupertino.dart';

class Debounce {
  final int millisecond;
  Debounce({
    this.millisecond = 500,
  });

  Timer? timer;

  void run(VoidCallback action) {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: millisecond), action);
  }
}
