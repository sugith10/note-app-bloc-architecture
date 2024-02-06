// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NoteModel {
  final String title;
  final String description;
  final String id;
  NoteModel({
    required this.title,
    required this.description,
    required this.id,
  });


  NoteModel copyWith({
    String? title,
    String? description,
    String? id,
  }) {
    return NoteModel(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] as String,
      description: map['description'] as String,
      id: map['_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NoteModel(title: $title, description: $description, id: $id)';

  @override
  bool operator ==(covariant NoteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.id == id;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ id.hashCode;
}
