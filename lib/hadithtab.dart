import 'package:flutter/material.dart';
import 'package:flutter_project/hadithdetailscreen.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<Hadith> hadithlist = [];

  @override
  void initState() {
    super.initState();
    loadhadithfiles();
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Image.asset(
                "assets/images/Quran@1x.png",
                width: 200,
                height: 200,
              ),
              Expanded(
                child: hadithlist.isEmpty
                    ? const Center(
                  child: CircularProgressIndicator(color: Color(0xFF65D6FC)),
                )
                    : ListView.separated(
                  itemCount: hadithlist.length,
                  separatorBuilder: (context, index) =>
                      Divider(
                        color: Color(0xFFFFFFFF),
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HadithDetailScreen(hadith: hadithlist[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        child: Text(
                          hadithlist[index].title,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color(0xFF65D6FC),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Amiri',
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void loadhadithfiles() async {
    String hadithcontent = await DefaultAssetBundle.of(context).loadString(
        'assets/files/hadith.txt');

    List<String> hadithBlocks = hadithcontent.trim().split('##');
    List<Hadith> tempList = [];
    for (String block in hadithBlocks) {

      block = block.trim();
      if (block.isNotEmpty) {

        List<String> hadithlines = block
            .split('\n')
            .map((line) => line.trim())
            .toList();
        if (hadithlines.isNotEmpty) {

          String title = hadithlines[0];

          List<String> content = hadithlines.sublist(1).where((line) =>
          line.isNotEmpty).toList();
          Hadith hadith = Hadith(title: title, content: content);
          tempList.add(hadith);
        }
      }
    }
    setState(() {
      hadithlist = tempList;
    });
  }
}

class Hadith {
  String title;
  List<String> content;

  Hadith({required this.title, required this.content});
}
