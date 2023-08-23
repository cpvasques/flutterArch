import 'dart:convert';

class ModelExample {
  final int id;
  final String name;
  final String description;
  final double value;
  ModelExample({
    required this.id,
    required this.name,
    required this.description,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'value': value,
    };
  }

  factory ModelExample.fromMap(Map<String, dynamic> map) {
    return ModelExample(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      value: map['value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelExample.fromJson(String source) =>
      ModelExample.fromMap(json.decode(source) as Map<String, dynamic>);
}

// {
// "id": 1,
// "name": "Nome",
// "description": "Descrição qualquer de exemplo",
// "value": 15,
// },