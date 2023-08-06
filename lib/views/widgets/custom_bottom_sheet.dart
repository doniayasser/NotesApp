import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app_cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/app_cubit/add_note_cubit/add_note_states.dart';
import 'package:notes_app/app_cubit/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create:  (context)=> AddNoteCubit(),
      child: Padding(
        padding:  EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocConsumer<AddNoteCubit,AddNoteStates>(
          listener: (context,state){
            if(state is AddNoteSuccessState)
              {
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).fetchNotes();
              }
            else if(state is AddNoteFailureState)
              {
                print("failed to add note${state.errorMessage}");
              }
          },
          builder: (context,state){
            return AbsorbPointer(
              absorbing: state is AddNoteLoadingState ? true : false,
                child: const SingleChildScrollView(
                    child: AddNoteForm(),
                ));
            },
        ),
      ),
    );
  }
}



