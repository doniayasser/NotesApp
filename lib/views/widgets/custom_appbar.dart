import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,required this.title,required this.barIcon, this.onPressed});
  final String title;
  final IconData barIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 26),),
         CustomSearchIcon(
           barIcon: barIcon,
           onPress: onPressed,
         ),
      ],
    );
  }
}

