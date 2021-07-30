import 'dart:math';

import 'dart:ui';

class RandomColor extends Color {
  static final _random = Random();

  RandomColor()
      : super.fromARGB(
          255,
          _random.nextInt(255),
          _random.nextInt(255),
          _random.nextInt(255),
        );
}
