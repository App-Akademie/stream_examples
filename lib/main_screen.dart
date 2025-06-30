import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /* 
    Streams available in this project:

    - generateNumber(): Generates a stream of random numbers between 0 and 99.
    - generateLocations(): Generates a stream of location (geo coordinates) updates.
    - generateIpAddress(): Generates a stream of random IP address updates.
  
     */

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Hello World!'),
              FilledButton(
                onPressed: () {},
                child: Text('Start listening to stream'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
