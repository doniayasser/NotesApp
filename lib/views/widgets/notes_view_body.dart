import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app_cubit/notes_cubit/notes_cubit.dart';
import 'custom_appbar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
   NotesViewBody({super.key});
  bool isDark=true;

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override

  void initState()
  {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchNotes();

  }
  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 30.0,),
          CustomAppBar(
              title: "Notes",
              barIcon: Icons.more_vert_outlined,
            onPressed: (){
                widget.isDark= !widget.isDark;
            },
          ),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}

// PopupMenuButton<int>(
// color: Colors.grey,
// elevation: 2,
// itemBuilder: (context){
// PopupMenuItem(
// value: 1,
// child: Row(
// children: [
// Icon(Icons.brightness_5),
// SizedBox(width: 15.0,),
// Text('Brightness'),
// ],
// ),
//
// );
// PopupMenuItem(
// value: 2,
// child: Row(
// children: [
// Icon(Icons.search_outlined),
// SizedBox(width: 15.0,),
// Text('Search'),
// ],
// ),
//
// );
// },
// );



