import 'package:flutter/material.dart';
import 'package:islami_c8_friday/providers/sura_details_provider.dart';
import 'package:islami_c8_friday/sura_model.dart';
import 'package:provider/provider.dart';

class SuraContent extends StatelessWidget {
  static const String routeName = "suracontent";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var pro = Provider.of<SuraDetailsProvider>(context);
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    Theme.of(context).colorScheme.brightness == Brightness.light
                        ? "assets/images/main_bg.png"
                        : "assets/images/dark_main_bg.png",
                  ),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
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
                            pro.verses[index],
                            textAlign: TextAlign.center,
                          )));
                },
                itemCount: pro.verses.length,
              ),
            ),
          ),
        );
      },
    );
  }
}
