import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_stack_social_app/ui/login/login_screen.dart';
import 'package:full_stack_social_app/utils/utils.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isChecked = false;

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
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.shade400), // Normal state border
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.shade400), // Focused state border
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey
                          .shade400), // Enabled state border when not focused
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'FullName',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.shade400), // Normal state border
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.shade400), // Focused state border
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey
                          .shade400), // Enabled state border when not focused
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.shade400), // Normal state border
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.shade400), // Focused state border
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey
                          .shade400), // Enabled state border when not focused
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value:
                        _isChecked, // This should be a boolean state variable in your widget.
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked =
                            newValue!; // Update the state of the checkbox.
                      });
                    },
                  ),
                  Text(
                    'Remember Me',
                    style: CommonUtils()
                        .dynamicTextStyle(fontSize: 13.0, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  context.go("/homescreen");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                child: Text(
                  'Signup',
                  style: CommonUtils().dynamicTextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          
         
           
          ],
        ),
      ),
    );
  }
}
