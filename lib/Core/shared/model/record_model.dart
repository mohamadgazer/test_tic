// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecordModel {
  final int id;
  final String deadDate;
  final String recordNum;
  final String name;
  final String mate;
  final String recordSourc;
  final String quran;
  final String hasPublished;

  RecordModel(
      {required this.id,
      required this.deadDate,
      required this.recordNum,
      required this.name,
      required this.mate,
      required this.recordSourc,
      required this.quran,
      required this.hasPublished});

  factory RecordModel.formjson(Map<String, dynamic> json) {
    return RecordModel(
      id: json["id"] ?? 00,
      deadDate: json["death_date"].toString() ?? "null",
      recordNum: json["record_num"].toString() ?? "null",
      name: json["name"].toString() ?? "null",
      mate: json["mate"].toString() ?? "null",
      recordSourc: json["recordSourc"].toString() ?? "null",
      quran: json["quran"].toString() ?? "null",
      hasPublished: json["has_published"].toString() ?? "null",
    );
  }

  @override
  String toString() {
    return '\nRecordModel(\nid: $id,\n deadDate: $deadDate,\n recordNum: $recordNum,\n name: $name,\n mate: $mate,\n recordSourc: $recordSourc, \nquran: $quran, \nhasPublished: $hasPublished )\n"==================================="';
  }
}
