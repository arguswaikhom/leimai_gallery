import 'package:cached_network_image/cached_network_image.dart';
import 'package:flirt_with_style/flirt_with_style.dart';
import 'package:flutter/material.dart';
import 'package:leimai_gallery/resources/app_mock.dart';

class SelectableProductWidget extends StatelessWidget {
  const SelectableProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CachedNetworkImage(
                imageUrl: kDummyProductImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product name',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Product category',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  '₹ 120.00',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const ProductQuantitySelectorWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductQuantitySelectorWidget extends StatefulWidget {
  const ProductQuantitySelectorWidget({Key? key}) : super(key: key);

  @override
  State<ProductQuantitySelectorWidget> createState() =>
      _ProductQuantitySelectorWidgetState();
}

class _ProductQuantitySelectorWidgetState
    extends State<ProductQuantitySelectorWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FSCircleButton(
          child: const Icon(
            Icons.remove_circle_outline,
            size: 30.0,
          ),
          onTap: () => setState(() => {if (value > 0) --value}),
        ),
        const SizedBox(width: 8.0),
        Text(
          value.toString(),
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8.0),
        FSCircleButton(
          child: const Icon(
            Icons.add_circle_rounded,
            size: 30.0,
          ),
          onTap: () => setState(() => {++value}),
        ),
      ],
    );
  }
}
