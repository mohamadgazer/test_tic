import 'package:flutter/material.dart';

class HomeModel {
  final IconData icon;
  final String title;
  String? body;
  final String? route;

  HomeModel({
    required this.icon,
    required this.title,
    this.body,
    required this.route,
  });
}
