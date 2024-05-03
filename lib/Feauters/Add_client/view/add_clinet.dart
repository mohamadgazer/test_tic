import 'package:flutter/material.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/functions/custom_back_dilog.dart';

class AddClient extends StatelessWidget {
  const AddClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text(addClient),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // إظهار الدايلوج عند النقر على زر العودة
          },
          child: const Text('العودة'),
        ),
      ),
    );
  }
}
