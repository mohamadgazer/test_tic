import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Feauters/Add_reservation/manger/client_cubit/cubit/client_cubit.dart';
import 'package:test_tic/Feauters/Add_reservation/view/add_reservation.dart';

import '../widgets/hive_test_panel.dart';
import '../widgets/home_body.dart';
// import 'package:test_tic/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Const.ticket),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HiveTestPanel(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
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
            context,
            MaterialPageRoute(
                builder: (_) => BlocProvider(
                      create: (context) => ClientCubit(),
                      child: const AddReservation(),
                    )));
      },
      child: const Icon(Icons.add),
    );
  }
}
