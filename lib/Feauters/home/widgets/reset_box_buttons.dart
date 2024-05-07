import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/model/clinet_model.dart';
import 'package:test_tic/Core/shared/model/reservation/reservation_model.dart';

class ResetBoxButtons extends StatelessWidget {
  const ResetBoxButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var reservation = ReservationModel(
        clientId: 0, date: DateTime.now(), id: 0, paidValue: 50, price: 0);
    return Column(
      children: [
        const Text("بوكس الحجوزات"),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final box = Hive.box<ReservationModel>(Const.reservation);

            await box.put(
                reservation.id, reservation); // ضع بيانات العميل داخل الـ box
          },
          child: const Text("وضع"),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final box = Hive.box<ReservationModel>(Const.reservation);
            final box2 = Hive.box<ClinetModel>(Const.clinet);
            print(box2.get(box.get(1)?.clientId));
            final clinet1 =
                box.values; // احصل على بيانات العميل باستخدام مفتاحه
            // print(clinet1);
            print(clinet1); // قم بطباعة اسم العميل كمثال
          },
          child: const Text("احصل"),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final box = Hive.box<ReservationModel>(Const.reservation);
            box.clear();
          },
          child: const Text("امسح"),
        ),
      ],
    );
  }
}
