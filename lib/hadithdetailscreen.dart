import 'package:flutter/material.dart';
import 'package:flutter_project/hadithtab.dart';

class HadithDetailScreen extends StatelessWidget {
  final Hadith hadith;

  const HadithDetailScreen({super.key, required this.hadith});

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              hadith.title,
              style: const TextStyle(
                fontFamily: 'Amiri',
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF65D6FC)),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Text(
                    hadith.content.join('\n'),
                    style: const TextStyle(
                      height: 2,
                      fontSize: 35,
                      fontFamily: 'Amiri',
                      color: Colors.black87,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
