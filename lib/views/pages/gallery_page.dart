import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';
import 'package:leimai_gallery/resources/app_color.dart';
import 'package:leimai_gallery/views/widgets/seller_impression_widget.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return FSColoredSafeArea(
      color: kPrimaryBg,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 267,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const SizedBox(
                width: 300,
                child: SellerImpressionWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
