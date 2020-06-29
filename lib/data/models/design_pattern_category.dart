import 'package:stormeventslima/data/models/fitur.dart';

class DesignPatternCategory {
  final String id;
  final String title;
  final int color;
  final List<Fitur> fiturs;

  DesignPatternCategory({
    this.id,
    this.title,
    this.color,
    this.fiturs,
  });

  factory DesignPatternCategory.fromJson(Map<String, dynamic> json) {
    var designPatternJsonList = json['fiturs'] as List;
    var designPatternList = designPatternJsonList
        .map((designPatternJson) => Fitur.fromJson(designPatternJson))
        .toList();

    return DesignPatternCategory(
      id: json['id'],
      title: json['title'],
      color: int.parse(json['color']),
      fiturs: designPatternList,
    );
  }
}