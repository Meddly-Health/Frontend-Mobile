import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        size: 30,
        duration: const Duration(milliseconds: 1000),
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
