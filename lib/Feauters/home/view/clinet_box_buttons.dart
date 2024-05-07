import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/model/clinet_model.dart';

class ClinetBoxButtons extends StatelessWidget {
  const ClinetBoxButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ClinetModel clinetModel = ClinetModel(
      id: 8,
      name: "غغغ",
      number: "0106655165",
      address: "alzarqa",
      createdAt: DateTime.now(),
    );
    return Column(
      children: [
        const Text("بوكس الزباين"),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final box = Hive.box<ClinetModel>(Const.clinet);
            await box.put(
                clinetModel.id, clinetModel); // ضع بيانات العميل داخل الـ box
          },
          child: const Text("وضع"),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            var box = Hive.box<ClinetModel>(Const.clinet).values.toList();
            print(box);
            // final box = Hive.box<ClinetModel>(Const.clinet);
            // final clinet1 =
            //     box.values; // احصل على بيانات العميل باستخدام مفتاحه
            // print(clinet1);
            // print(clinet1); // قم بطباعة اسم العميل كمثال
          },
          child: const Text("احصل"),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final box = Hive.box<ClinetModel>(Const.clinet);
            box.clear();
          },
          child: const Text("امسح"),
        ),
      ],
    );
  }
}
