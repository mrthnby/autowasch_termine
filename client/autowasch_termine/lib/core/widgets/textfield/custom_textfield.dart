import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.isHidden = false,
    this.maxLines = 1,
    this.suffixText = "",
    this.isReadOnly = false,
    this.prefixIcon,
    this.onTap,
  });

  final TextEditingController controller;
  final String hint;
  final String label;
  final bool isHidden;
  final int maxLines;
  final String suffixText;
  final bool isReadOnly;
  final Icon? prefixIcon;
  final VoidCallback? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPassVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      readOnly: widget.isReadOnly,
      maxLines: widget.maxLines,
      obscureText: widget.isHidden && !isPassVisible,
      obscuringCharacter: "•",
      cursorColor: Colors.orange.shade300,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixText: widget.suffixText,
        suffixIcon: !widget.isHidden
            ? null
            : IconButton(
                color: Colors.orange.shade300,
                splashRadius: 1,
                onPressed: () {
                  setState(() {
                    isPassVisible = !isPassVisible;
                  });
                },
                icon: Icon(
                  isPassVisible
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                ),
              ),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange.shade300)),
        hintText: widget.hint,
        labelText: widget.label,
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (states) {
            final Color color = states.contains(MaterialState.focused)
                ? Colors.orange.shade300
                : Colors.black;
            return TextStyle(color: color);
          },
        ),
      ),
    );
  }
}
