import 'package:flutter/material.dart';
import 'package:test_tic/Core/shared/body_tempalte.dart';
import 'package:test_tic/Core/shared/functions/custom_app_bar.dart';
import 'package:test_tic/Core/shared/model/clinet_model.dart';

import '../widgets/custom_client_search_bar.dart';

class AddReservation extends StatefulWidget {
  final ClinetModel? clinetModel;
  const AddReservation({super.key, this.clinetModel});

  @override
  State<AddReservation> createState() => _AddReservationState();
}

class _AddReservationState extends State<AddReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: CustomBodyTempalte(
        children: const [
          CustomClientSearchBar(),

          // CustomFormField(formKey: formKey, widget: widget),
        ],
      ),
    );
  }
}
