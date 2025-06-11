import 'package:flutter/material.dart';
import 'package:flutter_project/surahdetailsscreen.dart';

class Surahscreen extends StatelessWidget {
  List<String> SurahNames;
  List<int> SurahVerses;

  Surahscreen({required this.SurahNames, required this.SurahVerses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                SurahDetailsScreen.routname,
                arguments: SurahDetailsArgs(
                  name: SurahNames[index],
                  index: index,
                ),
              );
            },
            splashColor: Color(0xFF65D6FC).withOpacity(0.3),
            // Ripple effect color
            highlightColor: Color(0xFF65D6FC).withOpacity(0.1),
            // Highlight on press
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(Icons.menu_book, color: Color(0xFF65D6FC)),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    '${SurahNames[index]}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Amiri',
                      color: Color(0xFF65D6FC),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Text(
                  '${SurahVerses[index]}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri',
                    color: Color(0xFF65D6FC),
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: SurahNames.length,
    );
  }
}
