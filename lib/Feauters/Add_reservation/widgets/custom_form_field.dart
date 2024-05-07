import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/model/reservation/reservation_model.dart';
import 'package:test_tic/Feauters/Add_client/view/add_clinet.dart';
import 'package:test_tic/Feauters/Add_reservation/manger/client_cubit/cubit/client_cubit.dart';
import 'package:test_tic/Feauters/home/view/home_View.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.formKey,
    required this.id,
  });
  final int id;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return Const.requiredField;
              }
              return null;

              //Todo: add validation
            },
            labelText: Const.constCount,
            controller:
                BlocProvider.of<ClientCubit>(context).constCountController,
          ),
          SizedBox(
            height: Const.h30,
          ),
          CustomTextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return Const.requiredField;
              }
              return null;

              //Todo: add validation
            },
            labelText: Const.reservationDate,
            controller:
                BlocProvider.of<ClientCubit>(context).reservationDateController,
          ),
          SizedBox(
            height: Const.h30,
          ),
          SizedBox(
            height: Const.h30,
          ),
          ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  var box = Hive.box<ReservationModel>(Const.reservation);
                  var idreservation = box.values.length;

                  var reservation = ReservationModel(
                    id: idreservation,
                    clientId: id,
                    date: DateTime.now(),
                    paidValue: double.parse(
                        BlocProvider.of<ClientCubit>(context)
                            .constCountController
                            .text),
                    price: 50,
                  );

                  await box.add(reservation);

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomeView();
                    },
                  ), (route) => false);
                }
              },
              child: const Text(Const.save)),
        ],
      ),
    );
  }
}
