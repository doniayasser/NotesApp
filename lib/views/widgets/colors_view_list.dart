import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app_cubit/add_note_cubit/add_note_cubit.dart';

import '../../shared/components/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.colorActive, required this.color});
  final bool colorActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return  colorActive ?    CircleAvatar(
      backgroundColor: Colors.white.withOpacity(0.09),
      radius: 28,
      child:  CircleAvatar(
        radius: 22.0,
        backgroundColor: color,
      ),
    ) :  CircleAvatar(
      radius: 18.0,
      backgroundColor: color,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
   int colorIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ListView.builder(
        itemCount: kNoteColor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                colorIndex=index;
                BlocProvider.of<AddNoteCubit>(context).addNoteColor=kNoteColor[index];
                setState(() {});
              },
              child: ColorItem(
                color: kNoteColor[index],
                colorActive: colorIndex == index ,
              ),
            ),
          );
        },


      ),
    );
  }
}


