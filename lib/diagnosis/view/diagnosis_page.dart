import 'package:flutter/material.dart';
import 'package:meddly/widgets/widgets.dart';

class DiagnosisPage extends StatelessWidget {
  const DiagnosisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context,
                  'El evento ha ocurrido con exito ', SnackBarType.success));
            },
            child: const Text('snackbar')),
      ),
    );
  }
}
