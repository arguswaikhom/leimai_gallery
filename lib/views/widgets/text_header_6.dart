import 'package:flutter/material.dart';

class TextHeader6 extends StatelessWidget {
  final String text;

  const TextHeader6(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
