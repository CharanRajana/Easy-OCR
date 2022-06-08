import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:quick_scan/extras/fonts.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? barcodeScanRes;

  Future<void> scanCode() async {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666",
      "Cancel",
      true,
      ScanMode.DEFAULT,
    );

    setState(
      () {
        barcodeScanRes = barcodeScanRes;
      },
    );
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
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'SCAN',
                    style: bigText,
                  ),
                ),
                Image(
                  width: MediaQuery.of(context).size.width * 0.7,
                  image: const AssetImage(
                    'assets/images/scanning.png',
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.black,
                      fixedSize: const Size(150, 40),
                      textStyle: smallText,
                    ),
                    label: const Text(
                      'start scan',
                    ),
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                    ),
                    onPressed: () {
                      scanCode();
                    },
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
