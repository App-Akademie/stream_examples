import 'dart:math';

Stream<int> generateNumber() {
  final random = Random();
  return Stream<int>.periodic(
    const Duration(seconds: 1),
    (count) =>
        random.nextInt(100), // Generates a random number between 0 and 99
  );
}
