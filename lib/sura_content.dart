import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c8_friday/sura_model.dart';

class SuraContent extends StatefulWidget {
  static const String routeName = "suracontent";

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;

    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/main_bg.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.suraName,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: Card(
          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          elevation: 12,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              endIndent: 40,
              indent: 40,
              thickness: 1,
              color: Theme.of(context).primaryColor,
            ),
            itemBuilder: (context, index) {
              return Center(
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        verses[index],
                        textAlign: TextAlign.center,
                      )));
            },
            itemCount: verses.length,
          ),
        ),
      ),
    );
  }

  void loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    verses = lines;
    print(lines);
    setState(() {});
  }
}
