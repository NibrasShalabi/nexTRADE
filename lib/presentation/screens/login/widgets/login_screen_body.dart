import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextrade/core/constants/text_style.dart';
import 'package:nextrade/core/widgets/custom_button.dart';
import '../../../../core/widgets/crypto_icons_layer.dart';
import '../../../../logic/blocs/login/login_bloc.dart';
import '../../../../logic/blocs/login/login_event.dart';
import '../../../../logic/blocs/login/login_state.dart';
import '../../splash/widgets/button_part.dart';
import 'login_form_section.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return SafeArea(
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✅ Logged in successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('⚠️ ${state.message}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Stack(
          children: [
            const RepaintBoundary(child: CryptoIconsLayer(scale: 4.0)),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 140.h),
                  Text(
                    'Welcome to nexTRADE',
                    style: AppTextStyle.textStyle30,
                  ),
                  SizedBox(height: 60.h),
                  const LoginFormSection(),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      final isLoading = state is LoginLoading;
                      final formState = LoginFormSection.of(context);

                      return CustomButton(
                        text: 'Log In',
                        isLoading: isLoading,
                        onPressed: isLoading
                            ? () {}
                            : () {
                          final email =
                              formState?.emailController.text ?? '';
                          final password =
                              formState?.passwordController.text ?? '';
                          bloc.add(LoginSubmitted(
                            email: email,
                            password: password,
                          ));
                        },
                        height: 60.h,
                      );
                    },
                  ),
                  const ButtonPart(),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
