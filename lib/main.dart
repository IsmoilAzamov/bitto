import 'package:bitto/colors.dart';
import 'package:bitto/responsive/mobile_screen_layout.dart';
import 'package:bitto/responsive/responsive_layout_screen.dart';
import 'package:bitto/responsive/web_screen_layout.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark().copyWith(
scaffoldBackgroundColor: backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      title: "Bitto",
      home:  const ResponsiveLayoutScreen(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
