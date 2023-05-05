import 'package:flutter/material.dart';
import 'package:islami_c8_friday/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ShowLanguageSheetWidget extends StatelessWidget {
  const ShowLanguageSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (pro.languageCode == "en") {
                return;
              }
              pro.changeLanguage("en");
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("English",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: pro.languageCode == "en"
                                ? Theme.of(context).primaryColor
                                : Colors.black54,
                          )),
                  Spacer(),
                  Icon(
                    Icons.done,
                    color: pro.languageCode == "en"
                        ? Theme.of(context).primaryColor
                        : Colors.black54,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            endIndent: 50,
            indent: 50,
            color: Theme.of(context).primaryColor,
          ),
          InkWell(
            onTap: () {
              if (pro.languageCode != "en") {
                return;
              }
              pro.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Arabic",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: pro.languageCode != "en"
                              ? Theme.of(context).primaryColor
                              : Colors.black54)),
                  Spacer(),
                  Icon(
                    Icons.done,
                    color: pro.languageCode != "en"
                        ? Theme.of(context).primaryColor
                        : Colors.black54,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
