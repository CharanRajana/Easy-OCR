import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quick_scan/extras/fonts.dart';

class GenerateScreen extends StatefulWidget {
  const GenerateScreen({Key? key}) : super(key: key);

  @override
  State<GenerateScreen> createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {
  final TextEditingController myController = TextEditingController();
  String result = '';

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'GENERATE',
                    style: bigText,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                  child: Visibility(
                    visible: result != '',
                    child: QrImage(
                      data: result,
                      version: QrVersions.auto,
                      size: 250.0,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    style: smallText,
                    controller: myController,
                    decoration: InputDecoration(
                      hintText: 'Input Here',
                      hintStyle: smallText,
                      fillColor: Colors.blue.shade200,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.black,
                      fixedSize: const Size(150, 40),
                      textStyle: smallText,
                    ),
                    label: const Text(
                      'generate',
                    ),
                    icon: const Icon(Icons.output_outlined),
                    onPressed: () => setState(
                      () {
                        result = myController.text;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
