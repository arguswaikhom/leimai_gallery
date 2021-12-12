import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';
import 'package:leimai_gallery/resources/app_color.dart';
import 'package:leimai_gallery/views/widgets/selectable_product_widget.dart';

class ProductSelectionPage extends StatefulWidget {
  const ProductSelectionPage({Key? key}) : super(key: key);

  @override
  _ProductSelectionPageState createState() => _ProductSelectionPageState();
}

class _ProductSelectionPageState extends State<ProductSelectionPage>
    with SingleTickerProviderStateMixin {
  bool showCartSummary = true;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, 4.0),
  ).animate(_controller);

  @override
  Widget build(BuildContext context) {
    const int itemCount = 6;

    return FSColoredSafeArea(
      color: kPrimaryBg,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shop'),
          leading: IconButton(
            onPressed: () {
              showCartSummary ? _controller.forward() : _controller.reverse();
              showCartSummary = !showCartSummary;
              setState(() {});
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == itemCount - 1
                      ? showCartSummary
                          ? const EdgeInsets.fromLTRB(
                              24.0, 16.0, 24.0, (8.0 + 96.0))
                          : const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0)
                      : const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                  child: const SelectableProductWidget(),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  height: 80.0,
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: kPrimaryBg,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 4.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FSCircleAvatar(
                        avatar: FSCircleAvatarData(
                          backgroundColor: Colors.white70,
                          foregroundColor: Colors.black,
                          child: const Icon(
                            Icons.shopping_bag_rounded,
                            size: 28.0,
                          ),
                          radius: 32.0,
                        ),
                        miniStatus: FSCircleAvatarMiniStatusData(
                          radius: 10.0,
                          alignment: Alignment.topRight,
                          child: Text(
                            '4',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(color: Colors.white),
                          ),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      Text(
                        '₹ 1240',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      FSCircleButton(
                        margin: const EdgeInsets.all(12.0),
                        onTap: () => {},
                        backgroundColor: Colors.white70,
                        child: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
