import 'package:flutter/material.dart';

class PasswordLogIn extends StatefulWidget {
  const PasswordLogIn({Key? key}) : super(key: key);

  @override
  _PasswordLogInState createState() => _PasswordLogInState();
}

class _PasswordLogInState extends State<PasswordLogIn> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          icon: _showPassword
              ? const Icon(
                  Icons.visibility,
                  color: Colors.blueGrey,
                )
              : const Icon(
                  Icons.visibility_off,
                  color: Colors.blueGrey,
                ),
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
        hintText: "Password",
        hintStyle: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.5),
        ),
        fillColor: Theme.of(context).accentColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      obscureText: !_showPassword,
    );
  }
}
