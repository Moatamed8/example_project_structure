// To parse this JSON data, do
//
//     final faqModel = faqModelFromMap(jsonString);

import 'dart:convert';

List<FaqModel> faqModelFromMap(String str) => List<FaqModel>.from(json.decode(str).map((x) => FaqModel.fromMap(x)));

String faqModelToMap(List<FaqModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class FaqModel {
  FaqModel({
    this.id,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
    this.isSelect=false
  });

  int id;
  String question;
  String answer;
  DateTime createdAt;
  DateTime updatedAt;
  bool isSelect;

  factory FaqModel.fromMap(Map<String, dynamic> json) => FaqModel(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "question": question,
    "answer": answer,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
