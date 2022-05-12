import 'package:flutter/material.dart';

class PasswordSignUp extends StatefulWidget {
  const PasswordSignUp({Key? key}) : super(key: key);

  @override
  _PasswordSignUpState createState() => _PasswordSignUpState();
}

class _PasswordSignUpState extends State<PasswordSignUp> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Confirm Password",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.vpn_key,
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
          ),
        ],
      ),
    );
  }
}
