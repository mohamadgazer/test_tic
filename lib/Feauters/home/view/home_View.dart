import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_tic/Core/shared/body_tempalte.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/model/clinet_model.dart';
import 'package:test_tic/Feauters/Add_client/view/add_clinet.dart';
// import 'package:test_tic/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ticket),
      ),
      body: const HomeBody(),
      floatingActionButton: const AddClinetFloatActionButton(),
    );
  }
}

class AddClinetFloatActionButton extends StatelessWidget {
  const AddClinetFloatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AddClient()));
      },
      child: const Icon(Icons.add),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ClinetModel clinetModel = ClinetModel(
      id: "8",
      name: "غغغ",
      number: "0106655165",
      address: "alzarqa",
      createdAt: DateTime.now(),
    );
    return Center(
      child: BodyTempalte(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final box = Hive.box<ClinetModel>(clinet);
              await box.put(
                  clinetModel.id, clinetModel); // ضع بيانات العميل داخل الـ box
            },
            child: const Text("وضع"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              // final box = Hive.box<Map<String, dynamic>>(clinet);
              // List<dynamic> x = box.values.toList();
              // List<ClinetModel> y =
              //     x.map((e) => ClinetModel.fromJson(e)).toList();

              // print(y);

              final box = Hive.box<ClinetModel>(clinet);
              final clinet1 =
                  box.values; // احصل على بيانات العميل باستخدام مفتاحه
              print(clinet1);
              // if (clinet1 != null) {
              //   print(clinet1.name); // قم بطباعة اسم العميل كمثال
              // } else {
              //   print("العميل غير موجود");
              // }
            },
            child: const Text("احصل"),
          ),
        ],
      ),
    );
  }
}
