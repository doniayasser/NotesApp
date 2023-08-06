import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/app_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import '../../shared/components/components.dart';
import '../edit_note_view.dart';


class NoteItem extends StatelessWidget {
  const NoteItem({super.key,required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder:(context) {return EditNoteView(noteEdit: note,);}));

      } ,
      child: Container(
        decoration:  BoxDecoration(
          color:  Color(note.noteColor),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0,bottom: 24.0,left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title:  Text(
                  note.title,
                  style: const TextStyle(
                      color: Colors.black,
                    fontSize: 24.0,
                  ),),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    note.noteContent,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      fontSize: 16.0,
                    ),),
                ),
                trailing: IconButton(
                  onPressed: (){
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchNotes();
                    snackBar(context, "Note deleted success.");
                  },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                      size: 20.0,)),
              ),
               Padding(
                 padding: const EdgeInsets.only(right: 24.0),
                 child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),),
               ),

            ],
          ),
        ),
      ),
    );
  }
}
