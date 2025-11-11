import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextrade/data/repositories/auth_repository.dart';
import '../../../logic/blocs/login/login_bloc.dart';
import 'widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(AuthRepository()),
      child: const Scaffold(
        body: LoginScreenBody(),
      ),
    );
  }
}
