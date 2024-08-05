import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String content;
  @HiveField(1)
  final DateTime date;

  NoteModel({required this.content, required this.date});
}