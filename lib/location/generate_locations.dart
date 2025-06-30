import 'dart:async';
import 'dart:math';

import 'package:stream_examples/location/location.dart';

Stream<Location> generateLocations() {
  final random = Random();

  return Stream<Location>.periodic(
    Duration(seconds: 1),
    (count) {
      final latitude = random.nextDouble() * 180 - 90; // Range: -90 to 90
      final longitude = random.nextDouble() * 360 - 180; // Range: -180 to 180
      return Location(latitude, longitude);
    },
  );
}
