import 'package:flutter/cupertino.dart';

import '../../models/note_model.dart';
import '../../shared/components/constants.dart';
import 'colors_view_list.dart';

class EditColor extends StatefulWidget {
  const EditColor({super.key,required this.editNote});
  final NoteModel editNote;

  @override
  State<EditColor> createState() => _EditColorState();
}


class _EditColorState extends State<EditColor> {
  late int colorIndex;

  @override
  void initState() {
    colorIndex=kNoteColor.indexOf(Color(widget.editNote.noteColor)) ;
    super.initState();
  }
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
                widget.editNote.noteColor=kNoteColor[colorIndex].value;
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
