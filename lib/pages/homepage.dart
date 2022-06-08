import 'package:flutter/material.dart';
import 'package:quick_scan/extras/fonts.dart';
import 'package:quick_scan/pages/scan_screen.dart';
import 'package:quick_scan/pages/generate_screen.dart';
import 'package:quick_scan/pages/history.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      body: PageView(
        onPageChanged: (value) => setState(
          () {
            _currentIndex = value;
          },
        ),
        controller: controller,
        children: const [
          ScanScreen(),
          GenerateScreen(),
          History(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo.shade900,
        child: SalomonBottomBar(
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          //selectedColorOpacity: 0.8,
          unselectedItemColor: Colors.blueGrey,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          currentIndex: _currentIndex,
          onTap: (i) => setState(() {
            _currentIndex = i;
            controller.jumpToPage(i);
          }),
          items: [
            /// qr scan
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 35,
              ),
              title: Text(
                "Scan",
                style: smallText,
              ),
              selectedColor: Colors.amber,
            ),

            /// qr generate
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.qr_code_2_outlined,
                size: 35,
              ),
              title: Text(
                "Generate",
                style: smallText,
              ),
              selectedColor: Colors.amber,
            ),

            /// history
            SalomonBottomBarItem(
              icon: const Icon(
                Icons.history_outlined,
                size: 35,
              ),
              title: Text(
                "History",
                style: smallText,
              ),
              selectedColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
