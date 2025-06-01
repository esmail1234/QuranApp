import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: QuranTab()));
}

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  _QuranTabState createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  int _selectedTab = 0; // 0 لـ Surah، 1 لـ Para

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/Quran@1x.png", width: 200, height: 200),

          _boxSearch(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 0; // اختيار Surah
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Surah",
                        style: TextStyle(
                          color:
                              _selectedTab == 0
                                  ? Color(0xFF65D6FC)
                                  : Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      Divider(
                        color:
                            _selectedTab == 0
                                ? Color(0xFF65D6FC)
                                : Colors.grey[600],
                        thickness: 3,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 1; // اختيار Para
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Para",
                        style: TextStyle(
                          color:
                              _selectedTab == 1
                                  ? Color(0xFF65D6FC)
                                  : Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      Divider(
                        color:
                            _selectedTab == 1
                                ? Color(0xFF65D6FC)
                                : Colors.grey[600],
                        thickness: 3,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child:
                _selectedTab == 0
                    ? SurahScreen() // شاشة Surah
                    : ParaScreen(), // شاشة Para
          ),
        ],
      ),
    );
  }
}

Widget _boxSearch() {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        Icon(Icons.search, color: Colors.grey[600]),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search in Quran',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}

// شاشة Surah
class SurahScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Surah Content Here', style: TextStyle(fontSize: 20)),
    );
  }
}

// شاشة Para
class ParaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Para Content Here', style: TextStyle(fontSize: 20)),
    );
  }
}
