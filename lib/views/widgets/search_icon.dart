import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key,required this.barIcon, this.onPress});
  final IconData barIcon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),

      ),
      child:  IconButton(
        onPressed: onPress,
        icon: Icon(
          barIcon,
          size: 28,

        ),
      ),
    );
  }
}

