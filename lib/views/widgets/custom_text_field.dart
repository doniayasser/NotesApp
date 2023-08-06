import 'package:flutter/material.dart';
import 'package:notes_app/shared/components/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines=1,
    this.onSave,
    this.onChange,
    this.control,
  });
  final String hint;
  final int maxLines;
  final Function(String?)? onSave;
  final void Function(String)? onChange;
  final TextEditingController? control;

  @override
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    print("pppppppppppppppppp$brightness");

    return TextFormField(
      controller: control,
      onChanged: onChange,
      onSaved: onSave,
      validator:(value){
        if(value?.isEmpty ?? true)
          {
            return 'Field is required, can not be empty';
          }
        return null;
      } ,
      decoration: InputDecoration(
        border: buildBorder(),
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor,) ,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),

      ),
      cursorColor: kPrimaryColor,
      maxLines: maxLines,


    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
      borderSide:  BorderSide(
        color: color ?? Colors.white ,
      ) ,
      );
  }
}
