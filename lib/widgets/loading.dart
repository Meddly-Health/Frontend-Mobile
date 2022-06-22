import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: color,
    );
  }
}
