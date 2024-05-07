import 'package:flutter/material.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/functions/custom_back_dilog.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        customBackDialog(context).then((value) {
          if (value == true) {
            Navigator.of(context).pop(); // العودة للصفحة السابقة
          }
        });
      },
    ),
    centerTitle: true,
    title: const Text(Const.addReservation),
  );
}
