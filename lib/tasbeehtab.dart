import 'package:flutter/material.dart';

class TasbeehTab extends StatefulWidget {
  const TasbeehTab({super.key});

  @override
  State<TasbeehTab> createState() => _TasbeehTabState();
}

int count = 0;
int phase = 0;

final List<String> azker = [
  'لا حول ولا قوة إلا بالله',
  'أستغفر الله',
  'لا إله إلا الله',
  'الله أكبر',
  'الحمد لله',
  'سبحان الله',
];

class _TasbeehTabState extends State<TasbeehTab> {
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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (count < 33) {
                      count++;
                    } else {
                      count = 0;
                      phase = ((phase + 1) % azker.length);
                    }
                  });
                },
                child: Image.asset(
                  "assets/images/Tasbih.png",
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill,
                  color: Color(0xFF65D6FC),
                ),
              ),
              SizedBox(height: 35),
              Text(
                "عدد التسبيحات",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Amiri",
                  color: Color(0xFF65D6FC),
                ),
              ),
              SizedBox(height: 60),
              Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF65D6FC),
                  shape: BoxShape.rectangle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$count',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amiri',
                  ),
                ),
              ),
              SizedBox(height: 60),

              TextButton(
                onPressed: () {
                  setState(() {
                    if (count < 33) {
                      count++;
                    } else {
                      count = 0;
                      phase = ((phase + 1) % azker.length);
                    }
                  });
                },
                child: Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFF65D6FC),
                    shape: BoxShape.rectangle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    azker[phase],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
