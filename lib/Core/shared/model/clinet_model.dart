// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'clinet_model.g.dart';

@HiveType(typeId: 0)
class ClinetModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String number;
  @HiveField(3)
  final String address;
  @HiveField(4)
  final DateTime createdAt;

  ClinetModel(
      {required this.id,
      required this.name,
      required this.number,
      required this.address,
      required this.createdAt});

  factory ClinetModel.fromJson(Map<String, dynamic> json) => ClinetModel(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  @override
  String toString() {
    return '\nClinetModel(id: $id, name: $name, number: $number, address: $address, createdAt: $createdAt)';
  }
}
