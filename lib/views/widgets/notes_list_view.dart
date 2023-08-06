import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/app_cubit/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesStates>(
      builder: (context, state) {
        List<NoteModel>notesList=BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: ListView.builder(
            itemCount: notesList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context,index)
              {
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: NoteItem(note: notesList[index]),
                );
              }
          ));
      },
    );
  }
}
