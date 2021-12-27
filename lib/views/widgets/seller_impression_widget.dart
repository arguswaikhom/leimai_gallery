import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:leimai_gallery/resources/app_mock.dart';
import 'package:leimai_gallery/views/widgets/text_header_6.dart';

class BusiinessIntroWidget extends StatelessWidget {
  const BusiinessIntroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(kDummyProductImage),
        ),
        SizedBox(width: 16.0),
        TextHeader6('Business account'),
      ],
    );
  }
}

class BusinessIntroProductWidget extends StatelessWidget {
  const BusinessIntroProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      controller: ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        for (int i = 0; i < 4; i++)
          CachedNetworkImage(
            imageUrl: kDummyProductImage,
            fit: BoxFit.cover,
          )
      ],
    );
  }
}

class SellerImpressionWidget extends StatelessWidget {
  const SellerImpressionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      color: Colors.white70,
      elevation: 0.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.all(12),
              child: BusiinessIntroWidget(),
            ),
            BusinessIntroProductWidget(),
          ],
        ),
      ),
    );
  }
}
