import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../data/models/transaction_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/text_style.dart';

class HomeTransactionsList extends StatelessWidget {
  const HomeTransactionsList({super.key});

  Color _getColor(String type) {
    if (type == 'Deposit') return AppColors.green;
    if (type == 'Withdraw') return Colors.redAccent;
    return Colors.white;
  }

  IconData _getIcon(String type) {
    return type == 'Deposit' ? Icons.arrow_downward : Icons.arrow_upward;
  }

  @override
  Widget build(BuildContext context) {
    final transactions = TransactionModel.mockList(); // بيانات وهمية مؤقتة

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Transactions',
          style: AppTextStyle.textStyle18.copyWith(
            color: AppColors.golden,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15.h),

        /// نعرض المعاملات بشكل ديناميكي من المودل
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final tx = transactions[index];
            final color = _getColor(tx.type);
            final icon = _getIcon(tx.type);

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: GlassCard(
                radius: 15.r,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(icon, color: color, size: 22.sp),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tx.type, style: AppTextStyle.textStyle16),
                          SizedBox(height: 2.h),
                          Text(
                            tx.date,
                            style: AppTextStyle.textStyle14
                                .copyWith(color: Colors.white54),
                          ),
                        ],
                      ),
                    ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${tx.type == 'Deposit' ? '+' : '-'}\$${tx.amount}',
                          style: AppTextStyle.textStyle16.copyWith(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          tx.status,
                          style: AppTextStyle.textStyle14.copyWith(
                            color: tx.status == 'Completed'
                                ? AppColors.green
                                : Colors.amber,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
