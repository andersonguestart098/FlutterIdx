import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  const DefaultInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Escreva um comentário...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        ),
        cursorWidth: 2,
        cursorHeight: 20,
      ),
    );
  }
}
