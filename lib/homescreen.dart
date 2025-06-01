import 'package:flutter/material.dart';
import 'package:flutter_project/hadithtab.dart';
import 'package:flutter_project/qurantab.dart';
import 'package:flutter_project/tasbeehtab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routname = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selecteditem = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/mainback_1x.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(title: const Text("Quran App"), centerTitle: true),

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF1B1F5C),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            currentIndex: selecteditem,
            onTap: (index) {
              selecteditem = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/qurani.png")),
                label: "Quran",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/rosary.png")),
                label: "Tasbeeh ",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/quran.png")),
                label: "Hadith",
              ),
            ],
          ),

          body: tabs[selecteditem],
        ),
      ],
    );
  }

  List<Widget> tabs = [QuranTab(), TasbeehTab(), HadithTab()];
}
