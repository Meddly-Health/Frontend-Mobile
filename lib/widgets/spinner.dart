import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/helpers/assets_provider.dart';

class Spinner extends StatefulWidget {
  const Spinner({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  State<Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _controller.forward();
    _controller.addListener(() {
      setState(() {
        if (_controller.status == AnimationStatus.completed) {
          _controller.repeat();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        child: SvgPicture.asset(
          AssetsProvider.spinner,
          color: widget.color,
        ),
        builder: (context, widget) => RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: widget));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
