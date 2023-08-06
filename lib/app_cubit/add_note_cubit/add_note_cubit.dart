import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/app_cubit/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared/components/constants.dart';

class AddNoteCubit extends Cubit<AddNoteStates>
{
  Color addNoteColor=const Color(0xff987284);
  bool bottomSheetShown = false;
  IconData bottomSheetIcon = Icons.add;

  AddNoteCubit() : super(AddNoteInitialState());
  addNote(NoteModel note) async
  {
    note.noteColor=addNoteColor.value;
    emit(AddNoteLoadingState());
    try{
      var notesBox=Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    }catch(error){
      emit(AddNoteFailureState(error.toString()));
    }

  }

  void changeBottomSheet({required bool b, required IconData icon}) {
    bottomSheetShown = b;
    bottomSheetIcon = icon;
    emit(AppChangeBottomSheetState());
  }

}