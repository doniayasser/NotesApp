import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/shared/components/constants.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';
import 'app_cubit/notes_cubit/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: ThemeData(
          brightness:  NotesViewBody().isDark ? Brightness.dark : Brightness.light ,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: const NotesView(),
      ),
    );

        }
}








