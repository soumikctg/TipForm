import 'package:flutter/material.dart';
class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final IconData? iconData;
  const SimpleInputField({Key? key, required this.controller, required this.title, required this.hintText, this.iconData});

  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {

  static const Color containerColor = Color(0xFFEFEFEF);  // Light Gray
  static const Color textBlock = Color(0xFF333333);       // Dark Gray
  static const Color textlightBlock = Color(0xFF666666);  // Medium Gray
  static const Color clearButtonColor = Color(0xFFFFA500);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,color: textBlock)),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.w300, color: textlightBlock ),
            suffix: widget.iconData != null ? Icon(widget.iconData, color: textBlock):Text("data"),
            filled: true,
            fillColor: containerColor,

            border: OutlineInputBorder(
              borderSide: const BorderSide( width: 0, color: Colors.transparent ),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder : OutlineInputBorder(
              borderSide: const BorderSide( width: 0, color: Colors.transparent ),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder : OutlineInputBorder(
              borderSide: const BorderSide( width: 0, color: Colors.transparent ),
              borderRadius: BorderRadius.circular(5),
            ),

          ),
          onFieldSubmitted: (value){
            if(value.isEmpty){
              widget.controller.text = "0.00";
            }
            widget.controller.text = value.toString();
            setState(() {});


          },
          onSaved: (value){
            widget.controller.text = value.toString();
            setState(() {});
          },
          validator: (value){
            if(value == null|| value.isEmpty){
              return "Please enter a valid amount";
            }
            return null;
          },
        ),
      ],
    );
  }
}