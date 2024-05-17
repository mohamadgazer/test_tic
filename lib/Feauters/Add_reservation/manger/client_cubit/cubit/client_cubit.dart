import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Core/shared/model/clinet_model.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(ClientInitial());
  // client controller

  TextEditingController constCountController = TextEditingController();
  TextEditingController reservationDateController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();
// client number
  String clientnumber = "";
  var client = [];
  List<ClinetModel> box = Hive.box<ClinetModel>(Const.clinet).values.toList();

  void getClient() {
    emit(ClientInitial());
    emit(ClientAdd(box));
  }

// functions
  void addClient(ClinetModel name) {
    box.add(name);
    emit(ClientInitial());
  }
}
