// To parse this JSON data, do
//
//     final academicYearModel = academicYearModelFromJson(jsonString);

import 'dart:convert';

AcademicYearModel academicYearModelFromJson(String str) => AcademicYearModel.fromJson(json.decode(str));

String academicYearModelToJson(AcademicYearModel data) => json.encode(data.toJson());

class AcademicYearModel {
  int? status;
  List<Datum>? data;

  AcademicYearModel({
    this.status,
    this.data,
  });

  factory AcademicYearModel.fromJson(Map<String, dynamic> json) => AcademicYearModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? academicYearId;
  String? academicYear;
  String? academicStart;
  String? academicEnd;
  dynamic institutionId;
  DateTime? modifiedDate;
  dynamic pageNo;
  dynamic rowCount;
  dynamic totalCount;
  dynamic createdBy;
  dynamic modifiedBy;
  dynamic academicId;
  dynamic isDeleted;
  dynamic logo;
  dynamic institutionName;

  Datum({
    this.academicYearId,
    this.academicYear,
    this.academicStart,
    this.academicEnd,
    this.institutionId,
    this.modifiedDate,
    this.pageNo,
    this.rowCount,
    this.totalCount,
    this.createdBy,
    this.modifiedBy,
    this.academicId,
    this.isDeleted,
    this.logo,
    this.institutionName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    academicYearId: json["academicYearId"],
    academicYear: json["academicYear"],
    academicStart: json["academicStart"],
    academicEnd: json["academicEnd"],
    institutionId: json["institutionId"],
    modifiedDate: json["modifiedDate"] == null ? null : DateTime.parse(json["modifiedDate"]),
    pageNo: json["pageNo"],
    rowCount: json["rowCount"],
    totalCount: json["totalCount"],
    createdBy: json["createdBy"],
    modifiedBy: json["modifiedBy"],
    academicId: json["academicId"],
    isDeleted: json["isDeleted"],
    logo: json["logo"],
    institutionName: json["institutionName"],
  );

  Map<String, dynamic> toJson() => {
    "academicYearId": academicYearId,
    "academicYear": academicYear,
    "academicStart": academicStart,
    "academicEnd": academicEnd,
    "institutionId": institutionId,
    "modifiedDate": modifiedDate?.toIso8601String(),
    "pageNo": pageNo,
    "rowCount": rowCount,
    "totalCount": totalCount,
    "createdBy": createdBy,
    "modifiedBy": modifiedBy,
    "academicId": academicId,
    "isDeleted": isDeleted,
    "logo": logo,
    "institutionName": institutionName,
  };
}
