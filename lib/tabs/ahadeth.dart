import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c8_friday/hadethModel.dart';
import 'package:islami_c8_friday/hadeth_content.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadethFile();
    }

    return Column(
      children: [
        Image.asset("assets/images/hadeth_bg.png"),
        Divider(
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          "Ahadeth",
          style:
              GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        Divider(
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              endIndent: 35,
              indent: 35,
              color: Theme.of(context).primaryColor,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethContent.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  style: GoogleFonts.quicksand(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    //
    // try{
    //   String ahadeth=await rootBundle.loadString(key);
    // }catch(error){
    //   print(error);
    // }

    // "   Moh amed    " // >> .trim() : "Moh amed"
    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String> AhadethContent = value.split("#");

      for (int i = 0; i < AhadethContent.length; i++) {
        int lastIndex = AhadethContent[i].trim().indexOf("\n");
        String title = AhadethContent[i].trim().substring(0, lastIndex);
        print(title);
        String content = AhadethContent[i].trim().substring(lastIndex + 1);

        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }

      // for (int i = 0; i < AhadethContent.length; i++) {
      //   List<String> lines = AhadethContent[i].trim().split("\n");
      //   String title = lines[0];
      //   lines.removeAt(0);
      //   List<String> content = lines;
      //   print(title);
      //   HadethModel hadethModel = HadethModel(title, content);
      //   allAhadeth.add(hadethModel);
      // }
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
