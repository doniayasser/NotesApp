import 'package:flutter/material.dart';
import 'package:notes_app/shared/components/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,this.onTap,this.isLoading=false});
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child:  Center(
            child: isLoading ? const SizedBox(
              width: 26,
                height: 26,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),

            )
                : const Text(
              "Add",
              style: TextStyle(
                  color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
