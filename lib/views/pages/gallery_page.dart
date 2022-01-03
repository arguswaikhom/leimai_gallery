import 'package:cached_network_image/cached_network_image.dart';
import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:leimai_gallery/resources/app_color.dart';
import 'package:leimai_gallery/resources/app_mock.dart';
import 'package:leimai_gallery/views/widgets/seller_impression_widget.dart';

class ProductIntroWidget extends StatefulWidget {
  final String imageURL;

  const ProductIntroWidget({
    required this.imageURL,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductIntroWidget> createState() => _ProductIntroWidgetState();
}

class _ProductIntroWidgetState extends State<ProductIntroWidget> {
  bool isBookMarked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageURL,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: <Color>[
                    Colors.black54,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ 120',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Product name',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   top: -6.0,
            //   right: 0.0,
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 8.0),
            //     child: InkWell(
            //       onTap: () => setState(() => isBookMarked = !isBookMarked),
            //       child: Icon(
            //         isBookMarked
            //             ? Icons.bookmark_rounded
            //             : Icons.bookmark_border_rounded,
            //         color: Colors.white70,
            //         size: 28.0,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => {},
                    child: const Text('View more'),
                  ),
                ),
                SizedBox(
                  height: 227,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const SizedBox(
                      width: 240,
                      child: SellerImpressionWidget(),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: kProductImages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Leimai Gallery',
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                        ),
                      );
                    }
                    return ProductIntroWidget(
                      imageURL: kProductImages[index - 1],
                    );
                  },
                  staggeredTileBuilder: (i) => const StaggeredTile.fit(2),
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
