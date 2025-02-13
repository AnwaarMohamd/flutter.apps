import 'package:flutter/material.dart';

class OrSignUpRow extends StatefulWidget {
  const OrSignUpRow({super.key});

  @override
  State<OrSignUpRow> createState() => _OrSignUpState();
}

class _OrSignUpState extends State<OrSignUpRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey, // لون الخط
            thickness: 1, // سماكة الخط
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Or sign up with',
            style: TextStyle(
              color: Colors.grey, // لون النص
              fontSize: 14, // حجم النص
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey, // لون الخط
            thickness: 1, // سماكة الخط
          ),
        ),
      ],
    );
  }
}
