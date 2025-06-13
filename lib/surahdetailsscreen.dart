import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SurahDetailsScreen extends StatefulWidget {
  const SurahDetailsScreen({super.key});

  static const String routname = 'surahdetails';

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  List<String> verses = [];
  late SurahDetailsArgs args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as SurahDetailsArgs;
    loadFiles(args.index);
  }

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
          backgroundColor: Colors.transparent, // عشان الخلفية تبان
          appBar: AppBar(title: Text(args.name), centerTitle: true),
          body:
              verses.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                    itemCount: verses.length,
                    separatorBuilder:
                        (context, index) => Divider(
                          color: Color(0xFFBBC4CE),
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 16.0,
                        ),
                        child: Text(
                          '${verses[index]}  (${index + 1})',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Amiri',
                          ),
                          textAlign: TextAlign.center,

                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }

  void loadFiles(int index) async {
    String fileNumber = (index + 1).toString().padLeft(3, '0');
    String content = await rootBundle.loadString(
      "assets/files/$fileNumber.txt",
    );
    List<String> lines = content.trim().split('\n');
    setState(() {
      verses = lines;
    });
  }
}

class SurahDetailsArgs {
  final String name;
  final int index;

  SurahDetailsArgs({required this.name, required this.index});
}
