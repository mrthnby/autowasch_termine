import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Willkommen",
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 35),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Form(
              child: Column(
                children: [
                  LoginTextField(
                    hint: "example@mail.com",
                    label: "E-Mail",
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginTextField(
                    hint: "123456",
                    label: "Password",
                    controller: passwordController,
                    isHidden: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 60),
                      backgroundColor: Colors.orange.shade400,
                    ),
                    child: const Text("Login"),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("or"),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    child: const Text("Create Account"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.isHidden = false,
  });

  final TextEditingController controller;
  final String hint;
  final String label;
  final bool isHidden;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _isPassVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isHidden && _isPassVisible,
      obscuringCharacter: "•",
      cursorColor: Colors.orange.shade300,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: !widget.isHidden
            ? null
            : IconButton(
                color: Colors.orange.shade300,
                splashRadius: 1,
                onPressed: () {
                  setState(() {
                    _isPassVisible = !_isPassVisible;
                  });
                },
                icon: Icon(
                  _isPassVisible
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
