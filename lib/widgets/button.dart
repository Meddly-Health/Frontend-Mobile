import 'package:flutter/material.dart';

import 'loading.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.enabled,
    required this.onPressed,
    required this.animate,
    required this.enabledColor,
    required this.disbaledColor,
    required this.labelColor,
    required this.label,
    required this.keyString,
  }) : super(key: key);

  final bool enabled;
  final VoidCallback onPressed;
  final bool animate;
  final Color enabledColor;
  final Color disbaledColor;
  final Color labelColor;
  final String label;
  final String keyString;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key(keyString),
      onTap: onPressed,
      child: AnimatedContainer(
          height: 55,
          decoration: BoxDecoration(
            color: enabled ? enabledColor : disbaledColor,
            borderRadius: BorderRadius.circular(10),
          ),
          duration: const Duration(milliseconds: 200),
          child: Center(
            child: animate
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: Loading(),
                  )
                : Text(label,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: labelColor,
                        )),
          )),
    );
  }
}
