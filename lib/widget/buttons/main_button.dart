import'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key,this.action,this.label = ''}) : super(key: key);
  final VoidCallback? action;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(50)
      ),
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)
        ),
        child: Text(label, style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}