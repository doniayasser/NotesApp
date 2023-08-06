import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/search_icon.dart';
import '../../shared/components/components.dart';
import 'custom_appbar.dart';
import 'custom_edit_color.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
   String? editTitle,editContent;
   final TextEditingController titleData = TextEditingController();
   final TextEditingController contentData = TextEditingController();


  @override
  Widget build(BuildContext context) {
    titleData.text=widget.note.title.toString();
    contentData.text=widget.note.noteContent.toString();
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 30.0,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSearchIcon(
                barIcon: Icons.arrow_back_outlined,
                onPress: (){
                  Navigator.pop(context);
                },

              ),
              CustomAppBar(
                onPressed: () {
                  widget.note.title = editTitle ?? widget.note.title;
                  widget.note.noteContent = editContent ?? widget.note.noteContent;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                  Navigator.pop(context);
                  snackBar(context,"Note edited success.");
                },
                title: "Edit Notes",
                barIcon: Icons.check,


              ),
            ],
          ),
          const SizedBox(height: 24.0,),
          CustomTextField(
            control: titleData,
              hint: 'Title',
            onChange: (value) {
              editTitle = value;
            },
          ),
          const SizedBox(height: 16.0,),
          CustomTextField(
            control: contentData,
              hint: 'Content',
            maxLines: 7,
            onChange: (value) {
              editContent=value;
            },
          ),
          const SizedBox(height: 24.0,),
           EditColor(editNote: widget.note),

        ],
      ),
    );
  }
}