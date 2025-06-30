import 'dart:async';
import 'dart:math';

import 'package:stream_examples/ip_address/ip_address.dart';

Stream<IpAddress> generateIpAddresses() {
  final random = Random();
  return Stream<IpAddress>.periodic(
    Duration(seconds: 1),
    (count) {
      final part1 = random.nextInt(256);
      final part2 = random.nextInt(256);
      final part3 = random.nextInt(256);
      final part4 = random.nextInt(256);

      return IpAddress('$part1.$part2.$part3.$part4');
    },
  );
}
