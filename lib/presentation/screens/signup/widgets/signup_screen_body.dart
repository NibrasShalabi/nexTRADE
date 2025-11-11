  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:nextrade/core/constants/text_style.dart';
  import 'package:nextrade/core/widgets/custom_button.dart';
  import 'package:nextrade/logic/blocs/signup/signup_bloc.dart';
  import '../../../../core/widgets/crypto_icons_layer.dart';
  import '../../../../logic/blocs/signup/signup_event.dart';
  import '../../../../logic/blocs/signup/signup_state.dart';
  import 'signup_form_section.dart';

  class SignUpScreenBody extends StatelessWidget {
    const SignUpScreenBody({super.key});

    @override
    Widget build(BuildContext context) {
      final bloc = context.read<SignUpBloc>();

      return SafeArea(
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('✅ Account created successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is SignUpFailure) {
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
                    SizedBox(height: 120.h),
                    Text(
                      'Create your nexTRADE account',
                      style: AppTextStyle.textStyle30,
                    ),
                    SizedBox(height: 50.h),
                    const SignupFormSection(),
                    BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        final isLoading = state is SignUpLoading;
                        final form = SignupFormSection.of(context);
                        return CustomButton(
                          text: 'Sign Up',
                          isLoading: isLoading,
                          onPressed: isLoading
                              ? () {}
                              : () {
                            final name = form?.nameController.text ?? '';
                            final email = form?.emailController.text ?? '';
                            final password = form?.passwordController.text ?? '';
                            final referral = form?.codeController.text ?? '';

                            bloc.add(SignUpSubmitted(
                              name: name,
                              email: email,
                              password: password,
                              referralCode: referral.isEmpty ? null : referral,
                            ));
                          },
                          height: 60.h,
                        );

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
