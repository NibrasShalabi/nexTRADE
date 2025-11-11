import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../data/models/referral_model.dart';
import 'referral_list_tile.dart';

class ReferralListSection extends StatelessWidget {
  const ReferralListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final referrals = ReferralModel.mockList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Referrals',
          style: AppTextStyle.textStyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15.h),

        Container(
          height: 350.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: referrals.length,
            itemBuilder: (context, index) {
              final user = referrals[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: ReferralListTile(
                  name: user.name,
                  status: user.status,
                  reward: '\$${user.reward.toStringAsFixed(2)}',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
