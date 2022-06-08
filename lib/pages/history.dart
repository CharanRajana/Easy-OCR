import 'package:flutter/material.dart';
import 'package:quick_scan/extras/fonts.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber,
        child: const Icon(Icons.clear_all),
      ),
      backgroundColor: Colors.indigo.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'HISTORY',
                  style: bigText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
