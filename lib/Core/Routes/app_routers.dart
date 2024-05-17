import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tic/Core/Routes/routes.dart';
import 'package:test_tic/Feauters/Add_client/view/add_clinet.dart';
import 'package:test_tic/Feauters/Add_reservation/manger/client_cubit/cubit/client_cubit.dart';
import 'package:test_tic/Feauters/Add_reservation/view/add_reservation.dart';
import 'package:test_tic/Feauters/home/view/home_View.dart';
import 'package:test_tic/Feauters/viewClient/view/view_client_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // home
  Routes.home: (context) => const HomeView(),
  //add client

  Routes.addClient: (context) => BlocProvider(
        create: (context) => ClientCubit(),
        child: const AddClient(),
      ),
  //
  Routes.viewClient: (context) => BlocProvider(
        create: (context) => ClientCubit(),
        child: const ViewClientView(),
      ),
  // add reservation
  Routes.addReservation: (context) => BlocProvider(
        create: (context) => ClientCubit(),
        child: const AddReservation(),
      ),
};
