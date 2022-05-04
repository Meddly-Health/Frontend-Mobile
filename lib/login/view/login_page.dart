import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/helpers/assets_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SvgPicture.asset(AssetsProvider.meddly_logo),
      ]),
    );
  }
}
