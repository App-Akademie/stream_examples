import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:stream_examples/number/generate_number.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // State
  int? _number;
  StreamSubscription<int>? _numberSubscription;
  Stream<List<ConnectivityResult>>? _connectivityStream;

  @override
  void initState() {
    super.initState();
    _connectivityStream = Connectivity().onConnectivityChanged;
  }

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
              Text('$_number'),
              FilledButton(
                onPressed: () {
                  Stream<int> numberStream = generateNumber();
                  _numberSubscription = numberStream.listen(
                    (number) {
                      setState(() {
                        _number = number;
                      });
                    },
                  );
                },
                child: Text('Start listening to stream'),
              ),
              FilledButton(
                onPressed: () {
                  _numberSubscription?.cancel();
                },
                child: Text('Stop listening to stream'),
              ),
              SizedBox(height: 40),
              StreamBuilder(
                stream: _connectivityStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Icon(Icons.error);
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return Text(snapshot.data!.join(","));
                  } else {
                    return Text("no data available");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numberSubscription?.cancel();
    super.dispose();
  }
}
