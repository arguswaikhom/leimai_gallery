import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leimai_gallery/resources/app_color.dart';
import 'package:leimai_gallery/views/pages/gallery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Leimai Gallery',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryBg,
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryBg,
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.headline6,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      home: ScrollConfiguration(
        behavior: FSBouncingScrollBehavior(),
        child: const GalleryPage(),
      ),
    );
  }
}
