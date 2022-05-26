import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meddly/helpers/constants.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  'Buenos días, Lorenzo',
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                ),
              ),
              const Spacer(),
              const Icon(Icons.notifications)
            ],
          ),
        ],
      ),
    );
  }
}
