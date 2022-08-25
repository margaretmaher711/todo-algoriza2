import 'package:flutter/material.dart';


class TxtForms extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? widget;
  final Function()? function;
  TxtForms({Key? key, this.controller, this.hint, this.widget, this.function})
      : super(key: key);

  @override

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            // readOnly: Widget == null ? false : true,
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your task';
              }

              return null;
            },
            onSaved: (String? value) {
              // isertion(value);
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 1, color: Colors.grey)),
              hintText: hint,
              fillColor: Colors.grey[200],
              filled: true,
            ),
          
            onTap: function,
          ),
        ),
        widget == null ? Container() : Container(child: widget),
      ],
    );
  }

}



