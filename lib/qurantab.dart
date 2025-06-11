import 'package:flutter/material.dart';
import 'package:flutter_project/surahscreen.dart';

void main() {
  runApp(MaterialApp(home: QuranTab()));
}

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  _QuranTabState createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  int _selectedTab = 0;
  TextEditingController _searchController = TextEditingController();
  List<String> filteredSurahNames = [];
  List<int> filteredSurahVerses = [];

  List<String> quranSurahNames = [
    "الفاتحة",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النور",
    "الفرقان",
    "الشعراء",
    "النمل",
    "القصص",
    "العنكبوت",
    "الروم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصلت",
    "الشورى",
    "الزخرف",
    "الدخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزمل",
    "المدثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الانفطار",
    "المطففين",
    "الانشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];

  List<int> surahVerses = [
    7, // الفاتحة
    286, // البقرة
    200, // آل عمران
    176, // النساء
    120, // المائدة
    165, // الأنعام
    206, // الأعراف
    75, // الأنفال
    129, // التوبة
    109, // يونس
    123, // هود
    111, // يوسف
    43, // الرعد
    52, // إبراهيم
    99, // الحجر
    128, // النحل
    111, // الإسراء
    110, // الكهف
    98, // مريم
    135, // طه
    112, // الأنبياء
    78, // الحج
    118, // المؤمنون
    64, // النور
    77, // الفرقان
    227, // الشعراء
    93, // النمل
    88, // القصص
    69, // العنكبوت
    60, // الروم
    34, // لقمان
    30, // السجدة
    73, // الأحزاب
    54, // سبأ
    45, // فاطر
    83, // يس
    182, // الصافات
    88, // ص
    75, // الزمر
    85, // غافر
    54, // فصلت
    53, // الشورى
    89, // الزخرف
    59, // الدخان
    37, // الجاثية
    35, // الأحقاف
    38, // محمد
    29, // الفتح
    18, // الحجرات
    45, // ق
    60, // الذاريات
    49, // الطور
    62, // النجم
    55, // القمر
    78, // الرحمن
    96, // الواقعة
    29, // الحديد
    22, // المجادلة
    24, // الحشر
    13, // الممتحنة
    14, // الصف
    11, // الجمعة
    11, // المنافقون
    18, // التغابن
    12, // الطلاق
    12, // التحريم
    30, // الملك
    52, // القلم
    52, // الحاقة
    44, // المعارج
    28, // نوح
    28, // الجن
    20, // المزّمّل
    56, // المدّثر
    40, // القيامة
    31, // الإنسان
    50, // المرسلات
    40, // النبأ
    46, // النازعات
    42, // عبس
    29, // التكوير
    19, // الإنفطار
    36, // المطفّفين
    25, // الإنشقاق
    22, // البروج
    17, // الطارق
    19, // الأعلى
    26, // الغاشية
    30, // الفجر
    20, // البلد
    15, // الشمس
    21, // الليل
    11, // الضحى
    8, // الشرح
    8, // التين
    19, // العلق
    5, // القدر
    8, // البينة
    8, // الزلزلة
    11, // العاديات
    11, // القارعة
    8, // التكاثر
    3, // العصر
    9, // الهمزة
    5, // الفيل
    4, // قريش
    7, // الماعون
    3, // الكوثر
    6, // الكافرون
    3, // النصر
    5, // المسد
    4, // الإخلاص
    7, // الفلق
    6 // الناس
  ];

  @override
  void initState() {
    super.initState();
    filteredSurahNames = List.from(quranSurahNames);
    filteredSurahVerses = List.from(surahVerses);
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
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search in quran',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  filteredSurahNames = quranSurahNames
                      .where((sura) => sura.contains(value.trim()))
                      .toList();

                  filteredSurahVerses = [];

                  for (var name in filteredSurahNames) {
                    int index = quranSurahNames.indexOf(name);
                    filteredSurahVerses.add(surahVerses[index]);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

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
                  onTap: () => setState(() => _selectedTab = 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Surah",
                        style: TextStyle(
                          color: _selectedTab == 0 ? Color(0xFF65D6FC) : Colors
                              .grey[600],
                          fontSize: 16,
                        ),
                      ),
                      Divider(
                        color: _selectedTab == 0 ? Color(0xFF65D6FC) : Colors
                            .grey[600],
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
                  onTap: () => setState(() => _selectedTab = 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Para",
                        style: TextStyle(
                          color: _selectedTab == 1 ? Color(0xFF65D6FC) : Colors
                              .grey[600],
                          fontSize: 16,
                        ),
                      ),
                      Divider(
                        color: _selectedTab == 1 ? Color(0xFF65D6FC) : Colors
                            .grey[600],
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
            child: _selectedTab == 0
                ? Surahscreen(
              SurahNames: filteredSurahNames,
              SurahVerses: filteredSurahVerses,
            )
                : ParaScreen(),
          ),
        ],
      ),
    );
  }
}

class ParaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Para Content Here', style: TextStyle(fontSize: 20)),
    );
  }
}
