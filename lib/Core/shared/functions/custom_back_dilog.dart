import 'package:flutter/material.dart';
import 'package:test_tic/Core/shared/constant.dart';

Future<dynamic> customBackDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(Const.confirm),
        content: const Text(Const.confirmQust),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // إغلاق الدايلوج وعدم العودة
            },
            child: const Text(Const.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(true); // إغلاق الدايلوج والعودة للصفحة السابقة
            },
            child: const Text(Const.iconfirm),
          ),
        ],
      );
    },
  );
}
