import 'package:flutter/material.dart';
import 'package:meddly/helpers/constants.dart';
import 'package:meddly/widgets/page_title.dart';

class UserBasicInfoPage extends StatelessWidget {
  const UserBasicInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: defaultPadding,
          child: Column(
            children: const [
              PageTitle(title: 'Información básica'),
            ],
          ),
        ),
      ),
    );
  }
}
