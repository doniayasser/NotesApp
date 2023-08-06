import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app_cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/app_cubit/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:intl/intl.dart';
import '../../shared/components/components.dart';
import 'colors_view_list.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key,});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child:  Column(
        children: [
          const SizedBox(height: 24.0,),
          CustomTextField(
            onSave: (value){title=value;},
            hint: 'Title',
          ),
          const SizedBox(height: 16.0,),
          CustomTextField(
            onSave: (value){
              subTitle=value;
            },
            hint: 'Content',
            maxLines: 7,
          ),
          const SizedBox(height: 30.0,),
          const ColorsListView(),
          const SizedBox(height: 30.0,),
          BlocBuilder<AddNoteCubit,AddNoteStates>(
            builder: (context,state){
              return CustomButton(
                isLoading: state is AddNoteLoadingState ? true : false,
                  onTap:()
                  {
                    var date=DateTime.now();
                    var dateFormat=DateFormat('LLLL dd, yyyy').format(date);
                    if(formKey.currentState!.validate())
                    {
                      formKey.currentState!.save();
                      var noteData=NoteModel(
                        title: title!,
                        noteContent: subTitle!,
                        date: dateFormat,
                        noteColor: Colors.blue.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteData);
                    }
                    else
                    {
                      autoValidateMode=AutovalidateMode.always;
                    }
                    snackBar(context, "Note added success :)");
                  }
              );
            },

          ),
          const SizedBox(height: 32.0,),
        ],
      ),
    );
  }
}

