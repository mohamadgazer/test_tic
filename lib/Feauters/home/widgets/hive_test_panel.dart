import 'package:flutter/material.dart';

import '../view/clinet_box_buttons.dart';
import 'reset_box_buttons.dart';

class HiveTestPanel extends StatelessWidget {
  const HiveTestPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Test"),
      ),
      body: const SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClinetBoxButtons(),
            SizedBox(width: 10),
            ResetBoxButtons()
          ],
        ),
      ),
    );
  }
}
