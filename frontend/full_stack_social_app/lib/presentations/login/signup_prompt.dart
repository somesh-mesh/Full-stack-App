import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle( // Default text style
          color: Colors.grey.shade500,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(text: "Don't have an account? "),
          TextSpan(
            text: "Sign up.",
            style: TextStyle(
              color: Colors.blue, 
              decoration: TextDecoration.underline,  
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
               context.go("/signupscreen");
              
           },
          ),
        ],
      ),
    );
  }
}
