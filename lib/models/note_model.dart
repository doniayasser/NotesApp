import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject
{
  @HiveField(0)
   String title;
  @HiveField(1)
   String noteContent;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int noteColor;
  NoteModel({
    required this.title,
    required this.noteContent,
    required this.date,
    required this.noteColor,
  });
}