import 'package:flutter/material.dart';
import 'package:test_tic/Core/shared/body_tempalte.dart';

class HiveControlWidget extends StatelessWidget {
  const HiveControlWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomBodyTempalte(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [],
      ),
    );
  }
}
