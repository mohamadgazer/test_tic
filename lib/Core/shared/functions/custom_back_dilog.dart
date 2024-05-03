import 'package:flutter/material.dart';

Future<dynamic> customBackDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('تأكيد العودة'),
        content: const Text('هل أنت متأكد أنك تريد العودة؟'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // إغلاق الدايلوج وعدم العودة
            },
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(true); // إغلاق الدايلوج والعودة للصفحة السابقة
            },
            child: const Text('موافق'),
          ),
        ],
      );
    },
  );
}
