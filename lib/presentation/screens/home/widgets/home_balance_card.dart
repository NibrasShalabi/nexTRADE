import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../data/models/balance_model.dart';


class HomeBalanceCard extends StatelessWidget {
  const HomeBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final balance = BalanceModel.mock();

    return GlassCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // الجزء الزجاجي
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current Balance',
                    style: AppTextStyle.textStyle14
                        .copyWith(color: Colors.white70)),
                const SizedBox(height: 10),
                Text(
                  '\$${balance.balance}',
                  style: AppTextStyle.textStyle30.copyWith(
                    color: AppColors.green,
                    shadows: [
                      const Shadow(
                        blurRadius: 10,
                        color: AppColors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // الجزء الغامق
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Center(
                child: Text(
                  '+${balance.changePercent}%\nthis week',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyle16
                      .copyWith(color: AppColors.golden),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
