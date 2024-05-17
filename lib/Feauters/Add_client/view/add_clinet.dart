// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_tic/Core/Routes/routes.dart';
import 'package:test_tic/Core/shared/body_tempalte.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/functions/custom_back_dilog.dart';
import 'package:test_tic/Core/shared/model/clinet_model.dart';
import 'package:test_tic/Feauters/Add_reservation/manger/client_cubit/cubit/client_cubit.dart';

class AddClient extends StatelessWidget {
  const AddClient({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            customBackDialog(context).then((value) {
              if (value == true) {
                Navigator.pushNamedAndRemoveUntil(context, Routes.viewClient,
                    (route) => false); // العودة للصفحة السابقة
              }
            });
          },
        ),
        centerTitle: true,
        title: const Text(Const.addClient),
      ),
      body: CustomBodyTempalte(
        children: [
          Form(
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
                  labelText: Const.name,
                  controller: nameController,
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
                  labelText: Const.number,
                  controller: numberController,
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
                  labelText: Const.address,
                  controller: addressController,
                ),
                SizedBox(
                  height: Const.h30,
                ),
                BlocListener<ClientCubit, ClientState>(
                  listener: (context, state) {
                    if (state is ClientAdd) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(Const.addCliensuccess),
                        ),
                      );
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var box = Hive.box<ClinetModel>(Const.clinet);
                        var id = box.values.length;
                        var client = ClinetModel(
                          id: id,
                          name: nameController.text,
                          number: numberController.text,
                          address: addressController.text,
                          createdAt: DateTime.now(),
                        );

                        await box.add(client);
                        print(client.name);
                        // Navigator.pop(context,
                        //     BlocProvider.of<ClientCubit>(context).getClient));
                        BlocProvider.of<ClientCubit>(context).getClient();
                        Navigator.pushNamed(context, Routes.viewClient);
                      }
                    },
                    child: const Text(Const.save),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key, this.controller, required this.labelText, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(Const.r80))),
          labelText: labelText),
    );
  }
}
