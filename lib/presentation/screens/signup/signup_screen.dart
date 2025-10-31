import 'package:flutter/material.dart';
import 'package:nextrade/presentation/screens/signup/widgets/signup_screen_body.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SignupScreenBody() ,
    );
  }
}
