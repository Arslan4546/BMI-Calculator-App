
import 'package:flutter/material.dart';


class uiHelper{
  static customTextFormField({required String text, required IconData iconData , required TextEditingController controller}){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration:  InputDecoration(
            hintText: text,
            icon:Icon(iconData),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
            )
        ),
      ),
    );
  }
}