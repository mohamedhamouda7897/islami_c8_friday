import 'package:flutter/material.dart';
import 'package:islami_c8_friday/home_screen.dart';
import 'package:islami_c8_friday/my_theme.dart';
import 'package:islami_c8_friday/sura_content.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,

      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraContent.routeName: (context) => SuraContent(),
      },
    );
  }
}
