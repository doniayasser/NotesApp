import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_bottom_sheet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
                context: context,
                builder: (context){
                  return const AddNote();
                });
          },
        child: const Icon(Icons.mode_edit_outline_sharp),
      ),
      body:  NotesViewBody(),
    );
  }
}






