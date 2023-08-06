import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/app_cubit/notes_cubit/notes_states.dart';

import '../../models/note_model.dart';
import '../../shared/components/constants.dart';

class NotesCubit extends Cubit<NotesStates>
{
  NotesCubit() : super(NotesInitialState());
  List<NoteModel>? notes;
  fetchNotes()
  {
      var notesBox=Hive.box<NoteModel>(kNotesBox);
      notes= notesBox.values.toList();
      emit(DeleteNoteSuccessState());

  }

}