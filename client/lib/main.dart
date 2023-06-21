import 'dart:developer';

import 'package:app/screens/home_page.dart';
import 'package:app/utils/app_color.dart';
import 'package:app/utils/create_channel.dart';
import 'package:flutter/material.dart';
import 'package:protos/protos.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    log(
      '${rec.loggerName}: ${rec.level.name}: ${rec.time}: ${rec.message}',
    );
  });
  SuppService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      theme: ThemeData(
          fontFamily: 'grifterbold',
          // iconTheme: IconThemeData(color: Colors.white),
          scaffoldBackgroundColor: AppColor.whiteColor),

      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
