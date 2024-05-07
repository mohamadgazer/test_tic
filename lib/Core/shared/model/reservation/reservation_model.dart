// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'reservation_model.g.dart';

@HiveType(typeId: 1)
class ReservationModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int clientId;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final double paidValue;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final DateTime createdAt;

  ReservationModel({
    required this.id,
    required this.clientId,
    required this.date,
    required this.paidValue,
    required this.price,
  }) : createdAt = DateTime.now();

  @override
  String toString() {
    return '\nReservationModel(id: $id, clientId: $clientId, date: $date, paidValue: $paidValue, price: $price, createdAt: $createdAt)';
  }
}
