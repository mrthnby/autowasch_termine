import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.isHidden = false,
    this.maxLines = 1,
    this.suffixText = "",
  });

  final TextEditingController controller;
  final String hint;
  final String label;
  final bool isHidden;
  final int maxLines;
  final String suffixText;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool isPassVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      obscureText: widget.isHidden && !isPassVisible,
      obscuringCharacter: "•",
      cursorColor: Colors.orange.shade300,
      controller: widget.controller,
      decoration: InputDecoration(
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
