import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_stack_social_app/utils/utils.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/instagram_logo.svg"),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
            hintText: 'Username',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400), // Normal state border
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400), // Focused state border
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400), // Enabled state border when not focused
            ),
          ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400), // Normal state border
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400), // Focused state border
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400), // Enabled state border when not focused
            ),
          ),
            ),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forgot password?',
                  style: CommonUtils().dynamicTextStyle(
                      fontSize: 13.0,
                      //fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )),
                 SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                        onPressed: () {
                         context.go("/homescreen");
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                          ),
                        ),
                        child: Text(
                          'Log in',
                          style: CommonUtils().dynamicTextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   SvgPicture.asset("assets/icons/facebook.svg"),
                   SizedBox(width: 10,),
                   Text("Log In With Facebook",
                   style: CommonUtils().dynamicTextStyle(
                            fontSize: 14,
                            color: Color(0xff3797EF),
                            fontWeight: FontWeight.bold,
                          ),)
                ],),
                 SizedBox(height: 40),
                DividerWithText(text: "OR"),
                 SizedBox(height: 40),
                 SignUpPrompt()
          ],
        ),
      ),
    );
  }
}
class SignUpPrompt extends StatelessWidget {
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

class DividerWithText extends StatelessWidget {
  final String text;
  const DividerWithText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
