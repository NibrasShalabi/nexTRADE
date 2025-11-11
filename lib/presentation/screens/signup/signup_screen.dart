import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextrade/data/repositories/auth_repository.dart';
import '../../../logic/blocs/signup/signup_bloc.dart';
import 'widgets/signup_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(AuthRepository()),
      child: const Scaffold(
        body: SignUpScreenBody(),
      ),
    );
  }
}
