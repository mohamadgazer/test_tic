import 'package:flutter/material.dart';
import 'package:test_tic/Core/Routes/routes.dart';
import 'package:test_tic/Core/shared/constant.dart';
import 'package:test_tic/Feauters/home/data/models/home_model.dart';

List<HomeModel> homeData() {
  List<HomeModel> homeModel = [
    HomeModel(
      icon: Icons.person,
      title: Const.clientList,
      // body: "body",
      route: Routes.viewClient,
    ),
    HomeModel(
      icon: Icons.list_alt,
      title: "title",
      body: "body",
      route: Routes.addClient,
    ),
  ];
  return homeModel;
}
