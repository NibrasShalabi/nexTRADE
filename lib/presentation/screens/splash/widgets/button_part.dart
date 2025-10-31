import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ButtonPart extends StatelessWidget {
  const ButtonPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'if you don`t have you can ',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.green.shade900,
            ),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push('/Sing');
            },
            child: Text(
              ' SingUp',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.yellow.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
